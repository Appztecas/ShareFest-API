# Script for populating the database. You can run it as:
#     mix run priv/repo/seeds.exs

alias SharefestApi.Repo
alias SharefestApi.People.BusinessActivity
alias SharefestApi.People.BusinessActivities

# Inserting the initial catalog for business_activities
if BusinessActivities.list_business_activities() == [] do

  business_activities = [
    %BusinessActivity{name: "Animadores"},
    %BusinessActivity{name: "Bolos"},
    %BusinessActivity{name: "Comida - Banquetes/Catering"},
    %BusinessActivity{name: "Comida - Barra de Café"},
    %BusinessActivity{name: "Comida - Comida Orgánica"},
    %BusinessActivity{name: "Comida - Espiropapas"},
    %BusinessActivity{name: "Comida - Flautas/Tacos y Guisados"},
    %BusinessActivity{name: "Comida - Gourmet"},
    %BusinessActivity{name: "Comida - Hamburguesas/Hot Dogs"},
    %BusinessActivity{name: "Comida - Helados"},
    %BusinessActivity{name: "Comida - Paninis/Tortas"},
    %BusinessActivity{name: "Comida - Pizzas"},
    %BusinessActivity{name: "Comida - Quesadillas"},
    %BusinessActivity{name: "Comida - Rosca de Sushi"},
    %BusinessActivity{name: "Decoración/Flores"},
    %BusinessActivity{name: "Diseñadora"},
    %BusinessActivity{name: "Fotografía/Video"},
    %BusinessActivity{name: "Globos"},
    %BusinessActivity{name: "Inflables"},
    %BusinessActivity{name: "Maquillaje"},
    %BusinessActivity{name: "Mesa de carnes Frías/Quesos"},
    %BusinessActivity{name: "Mesa de Dulces"},
    %BusinessActivity{name: "Meseros"},
    %BusinessActivity{name: "Música"},
    %BusinessActivity{name: "Organización de Eventos"},
    %BusinessActivity{name: "Pasteles/Cup Cakes"},
    %BusinessActivity{name: "Pinta Caritas"},
    %BusinessActivity{name: "Piñatas"},
    %BusinessActivity{name: "Regalos de Agradecimiento"},
    %BusinessActivity{name: "Renta de Mobiliario"},
    %BusinessActivity{name: "Renta de Transporte"},
    %BusinessActivity{name: "Salones de Fiesta"},
    %BusinessActivity{name: "Shows - Temáticos"},
    %BusinessActivity{name: "Shows - Mago"},
    %BusinessActivity{name: "Shows - Cuenta Cuentos"},
    %BusinessActivity{name: "Shows - Títeres"},
    %BusinessActivity{name: "Valet Parking"}
  ]

  for activity <- business_activities do
      Repo.insert!(activity)
  end

end
