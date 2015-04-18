Router = require "./Router"

Todos = Application.module "Todos"

Todos.addInitializer ->
	@router = new Router
