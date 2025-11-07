class_name Money_Manager
extends Node

var current_money : int = 100

func add_money(money: int) :
	current_money += money

func can_remove_money(money: int) :
	return (current_money - money) >= 0

func remove_money(money: int) :
	if can_remove_money(money):
		current_money -= money
