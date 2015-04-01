Router = require "./Router"

Persons = Application.module "Persons"

Persons.addInitializer ->
	@router = new Router
