extends Control

@onready var balance_label: Label = $BalanceLabel
@onready var safe_label: Label = $SafeLabel
@onready var log_label: Label = $LogLabel
@onready var quest_title_label: Label = $QuestPanel/VBoxQuest/QuestTitle
@onready var quest_desc_label: Label = $QuestPanel/VBoxQuest/QuestDesc

var transfer_popup: CanvasLayer = null
var energy_wallet: CanvasLayer = null

func _ready() -> void:
	# 创建一个测试商店账户
	if not EnergySystem.has_account("shop_01"):
		EnergySystem.create_account("shop_01", {
			"display_name": "测试商店",
			"balance": 1000.0,
			"planet": "earth"
		})
	
	# 加载转账弹窗
	var popup_scene = load("res://scenes/TransferPopup.tscn")
	transfer_popup = popup_scene.instantiate()
	add_child(transfer_popup)
	transfer_popup.transfer_finished.connect(_on_popup_transfer_finished)
	
	# 加载能量钱包
	var wallet_scene = load("res://scenes/EnergyWallet.tscn")
	energy_wallet = wallet_scene.instantiate()
	add_child(energy_wallet)
	
	# 连接按钮信号
	$VBox/BtnAdd50.pressed.connect(_on_btn_add_50_pressed)
	$VBox/BtnAdd10.pressed.connect(_on_btn_add_10_pressed)
	$VBox/BtnDepositSafe.pressed.connect(_on_btn_deposit_safe_pressed)
	$VBox/BtnWithdrawSafe.pressed.connect(_on_btn_withdraw_safe_pressed)
	$VBox/BtnTransfer.pressed.connect(_on_btn_transfer_pressed)
	$VBox/BtnWallet.pressed.connect(_on_btn_wallet_pressed)
	
	# 能量与任务信号
	EnergySystem.energy_changed.connect(_on_energy_changed)
	EnergySystem.safe_changed.connect(_on_safe_changed)
	EnergySystem.transfer_completed.connect(_on_transfer_completed)
	
	QuestSystem.quest_started.connect(_on_quest_started)
	QuestSystem.quest_progressed.connect(_on_quest_progressed)
	QuestSystem.quest_completed.connect(_on_quest_completed)
	QuestSystem.all_main_quests_finished.connect(_on_all_quests_finished)
	
	update_ui()
	update_quest_ui()
	log("Energy-B 测试场景已启动。初始余额 500 EB")

func update_ui() -> void:
	var bal = EnergySystem.get_balance(EnergySystem.current_player_id)
	var safe = EnergySystem.get_safe_balance(EnergySystem.current_player_id)
	balance_label.text = "当前能量：%.1f EB" % bal
	safe_label.text = "保险柜：%.1f EB" % safe

func update_quest_ui() -> void:
	quest_title_label.text = "当前任务：" + QuestSystem.get_quest_progress_text()
	quest_desc_label.text = QuestSystem.get_quest_description()

func log(msg: String) -> void:
	log_label.text = msg
	print(msg)

func _on_energy_changed(account_id: String, new_balance: float, change: float) -> void:
	if account_id == EnergySystem.current_player_id:
		update_ui()

func _on_safe_changed(account_id: String, new_safe: float) -> void:
	if account_id == EnergySystem.current_player_id:
		update_ui()

func _on_transfer_completed(from_id: String, to_id: String, amount: float, reason: String, success: bool) -> void:
	if success:
		log("转账成功：%.1f EB  →  %s" % [amount, to_id])
	else:
		log("转账失败")

func _on_quest_started(quest_id: String) -> void:
	update_quest_ui()
	log("新任务开始：" + QuestSystem.get_current_quest().get("title", ""))

func _on_quest_progressed(quest_id: String, current: int, target: int) -> void:
	update_quest_ui()

func _on_quest_completed(quest_id: String) -> void:
	update_quest_ui()
	var q = QuestSystem.quests.get(quest_id, {})
	log("任务完成！获得奖励 +%.1f EB" % q.get("reward_eb", 0))

func _on_all_quests_finished() -> void:
	update_quest_ui()
	log("恭喜！第一关所有主线任务已完成！")

func _on_btn_add_50_pressed() -> void:
	EnergySystem.add_energy(EnergySystem.current_player_id, 50.0, "test_button")
	log("+50 EB 已到账")
	QuestSystem.report_action("add_energy_test")

func _on_btn_add_10_pressed() -> void:
	EnergySystem.add_energy(EnergySystem.current_player_id, 10.0, "solar_test")
	log("模拟发电 +10 EB")
	QuestSystem.report_action("generate")

func _on_btn_deposit_safe_pressed() -> void:
	if EnergySystem.deposit_to_safe(EnergySystem.current_player_id, 100.0):
		log("已存入保险柜 100 EB")
		QuestSystem.report_action("safe_deposit")
	else:
		log("存入失败（余额不足）")

func _on_btn_withdraw_safe_pressed() -> void:
	if EnergySystem.withdraw_from_safe(EnergySystem.current_player_id, 50.0):
		log("已从保险柜取出 50 EB")
		QuestSystem.report_action("safe_withdraw")
	else:
		log("取出失败（保险柜余额不足）")

func _on_btn_transfer_pressed() -> void:
	if transfer_popup:
		transfer_popup.open("shop_01", "测试商店", 20.0)
		log("已打开扫码转账界面")

func _on_btn_wallet_pressed() -> void:
	if energy_wallet:
		energy_wallet.open()
		log("已打开能量钱包")

func _on_popup_transfer_finished(success: bool, amount: float) -> void:
	if success:
		log("弹窗转账完成：-%.1f EB" % amount)
		QuestSystem.report_action("transfer_success")
	else:
		log("弹窗转账未成功")
