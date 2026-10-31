extends CanvasLayer

signal closed

@onready var available_value: Label = $Panel/Margin/VBox/BalanceCard/BalVBox/AvailableValue
@onready var safe_value: Label = $Panel/Margin/VBox/BalanceCard/BalVBox/SubBalances/SafeBox/SafeValue
@onready var bank_value: Label = $Panel/Margin/VBox/BalanceCard/BalVBox/SubBalances/BankBox/BankValue
@onready var total_value: Label = $Panel/Margin/VBox/BalanceCard/BalVBox/SubBalances/TotalBox/TotalValue
@onready var amount_edit: LineEdit = $Panel/Margin/VBox/AmountRow/AmountEdit
@onready var history_list: VBoxContainer = $Panel/Margin/VBox/HistoryScroll/HistoryList
@onready var status_label: Label = $Panel/Margin/VBox/StatusLabel

func _ready() -> void:
	visible = false
	
	$Panel/Margin/VBox/Header/BtnClose.pressed.connect(close)
	$Overlay.gui_input.connect(_on_overlay_input)
	
	$Panel/Margin/VBox/ActionButtons/BtnDepositSafe.pressed.connect(_on_deposit_safe)
	$Panel/Margin/VBox/ActionButtons/BtnWithdrawSafe.pressed.connect(_on_withdraw_safe)
	
	$Panel/Margin/VBox/AmountRow/Quick50.pressed.connect(func(): amount_edit.text = "50")
	$Panel/Margin/VBox/AmountRow/Quick100.pressed.connect(func(): amount_edit.text = "100")
	$Panel/Margin/VBox/AmountRow/QuickAll.pressed.connect(_set_all_amount)
	
	EnergySystem.energy_changed.connect(_on_energy_changed)
	EnergySystem.safe_changed.connect(_on_safe_changed)
	EnergySystem.bank_changed.connect(_on_bank_changed)
	EnergySystem.transaction_logged.connect(_on_transaction_logged)

func open() -> void:
	refresh_all()
	status_label.text = ""
	visible = true

func close() -> void:
	visible = false
	closed.emit()

func refresh_all() -> void:
	var id = EnergySystem.current_player_id
	available_value.text = "%.1f EB" % EnergySystem.get_balance(id)
	safe_value.text = "%.1f EB" % EnergySystem.get_safe_balance(id)
	bank_value.text = "%.1f EB" % EnergySystem.get_bank_balance(id)
	total_value.text = "%.1f EB" % EnergySystem.get_total_energy(id)
	_refresh_history()

func _refresh_history() -> void:
	# 清空旧列表
	for child in history_list.get_children():
		child.queue_free()
	
	var txs = EnergySystem.get_account_transactions(EnergySystem.current_player_id, 8)
	if txs.is_empty():
		var empty = Label.new()
		empty.text = "暂无交易记录"
		empty.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		history_list.add_child(empty)
		return
	
	for tx in txs:
		var label = Label.new()
		var amount = tx.get("amount", 0.0)
		var ttype = tx.get("type", "")
		var reason = tx.get("reason", "")
		var sign = "+"
		var color = Color(0.3, 0.9, 0.5)
		
		if ttype in ["remove", "transfer", "safe_deposit"] and tx.get("from_id") == EnergySystem.current_player_id:
			sign = "-"
			color = Color(1.0, 0.5, 0.4)
		
		# 转账收款时是加
		if ttype == "transfer" and tx.get("to_id") == EnergySystem.current_player_id:
			sign = "+"
			color = Color(0.3, 0.9, 0.5)
			amount = tx.get("received", amount)
		
		var text = "%s%.1f EB  [%s]" % [sign, amount, reason]
		label.text = text
		label.modulate = color
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		history_list.add_child(label)

func _get_amount() -> float:
	var t = amount_edit.text.strip_edges()
	if t.is_valid_float():
		return float(t)
	return 0.0

func _set_all_amount() -> void:
	amount_edit.text = "%.1f" % EnergySystem.get_balance(EnergySystem.current_player_id)

func _on_deposit_safe() -> void:
	var amount = _get_amount()
	if amount <= 0:
		status_label.text = "请输入有效金额"
		status_label.modulate = Color(1, 0.4, 0.4)
		return
	
	if EnergySystem.deposit_to_safe(EnergySystem.current_player_id, amount):
		status_label.text = "已存入保险柜 %.1f EB" % amount
		status_label.modulate = Color(0.3, 0.9, 0.5)
		QuestSystem.report_action("safe_deposit")
		refresh_all()
	else:
		status_label.text = "存入失败（余额不足）"
		status_label.modulate = Color(1, 0.4, 0.4)

func _on_withdraw_safe() -> void:
	var amount = _get_amount()
	if amount <= 0:
		status_label.text = "请输入有效金额"
		status_label.modulate = Color(1, 0.4, 0.4)
		return
	
	if EnergySystem.withdraw_from_safe(EnergySystem.current_player_id, amount):
		status_label.text = "已取出 %.1f EB" % amount
		status_label.modulate = Color(0.3, 0.9, 0.5)
		QuestSystem.report_action("safe_withdraw")
		refresh_all()
	else:
		status_label.text = "取出失败（保险柜余额不足）"
		status_label.modulate = Color(1, 0.4, 0.4)

func _on_energy_changed(account_id: String, _new_balance: float, _change: float) -> void:
	if visible and account_id == EnergySystem.current_player_id:
		refresh_all()

func _on_safe_changed(account_id: String, _new_safe: float) -> void:
	if visible and account_id == EnergySystem.current_player_id:
		refresh_all()

func _on_bank_changed(account_id: String, _new_bank: float) -> void:
	if visible and account_id == EnergySystem.current_player_id:
		refresh_all()

func _on_transaction_logged(_tx: Dictionary) -> void:
	if visible:
		_refresh_history()

func _on_overlay_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		close()
