extends CanvasLayer

signal transfer_finished(success: bool, amount: float)

@onready var recipient_label: Label = $Panel/Margin/VBox/RecipientLabel
@onready var amount_edit: LineEdit = $Panel/Margin/VBox/AmountEdit
@onready var fee_label: Label = $Panel/Margin/VBox/FeeLabel
@onready var status_label: Label = $Panel/Margin/VBox/StatusLabel
@onready var btn_confirm: Button = $Panel/Margin/VBox/Buttons/BtnConfirm
@onready var btn_cancel: Button = $Panel/Margin/VBox/Buttons/BtnCancel

var target_account_id: String = "shop_01"
var target_display_name: String = "测试商店"

func _ready() -> void:
	visible = false
	
	# 连接按钮
	$Panel/Margin/VBox/QuickAmounts/Btn10.pressed.connect(func(): _set_amount(10))
	$Panel/Margin/VBox/QuickAmounts/Btn50.pressed.connect(func(): _set_amount(50))
	$Panel/Margin/VBox/QuickAmounts/Btn100.pressed.connect(func(): _set_amount(100))
	$Panel/Margin/VBox/QuickAmounts/BtnAll.pressed.connect(_set_all_amount)
	
	btn_cancel.pressed.connect(close)
	btn_confirm.pressed.connect(_on_confirm_pressed)
	
	# 点击遮罩关闭
	$Overlay.gui_input.connect(_on_overlay_input)

func open(to_id: String = "shop_01", display_name: String = "测试商店", default_amount: float = 20.0) -> void:
	target_account_id = to_id
	target_display_name = display_name
	recipient_label.text = "收款方：%s" % display_name
	amount_edit.text = str(default_amount)
	status_label.text = ""
	fee_label.text = "手续费：0 EB"
	btn_confirm.disabled = false
	visible = true
	amount_edit.grab_focus()

func close() -> void:
	visible = false

func _set_amount(value: float) -> void:
	amount_edit.text = str(value)

func _set_all_amount() -> void:
	var bal = EnergySystem.get_balance(EnergySystem.current_player_id)
	amount_edit.text = "%.1f" % bal

func _on_confirm_pressed() -> void:
	var amount_text = amount_edit.text.strip_edges()
	if not amount_text.is_valid_float():
		status_label.text = "请输入有效金额"
		status_label.modulate = Color(1, 0.4, 0.4)
		return
	
	var amount: float = float(amount_text)
	if amount <= 0:
		status_label.text = "金额必须大于 0"
		status_label.modulate = Color(1, 0.4, 0.4)
		return
	
	# 执行转账
	btn_confirm.disabled = true
	status_label.text = "能量转移中..."
	status_label.modulate = Color(0.6, 0.9, 1.0)
	
	# 稍作延迟模拟网络感（可选）
	await get_tree().create_timer(0.4).timeout
	
	var success = EnergySystem.player_transfer(target_account_id, amount, "scan_transfer")
	
	if success:
		status_label.text = "能量转移成功！-%.1f EB" % amount
		status_label.modulate = Color(0.3, 0.9, 0.5)
		transfer_finished.emit(true, amount)
		
		# 成功后稍等再关闭
		await get_tree().create_timer(1.0).timeout
		close()
	else:
		status_label.text = "转账失败（余额不足或其他错误）"
		status_label.modulate = Color(1, 0.4, 0.4)
		btn_confirm.disabled = false
		transfer_finished.emit(false, amount)

func _on_overlay_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		close()
