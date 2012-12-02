require File.expand_path('../../config/boot.rb', __FILE__)
require 'padrino-core/cli/rake'
PadrinoTasks.init

questions = [
  { title: "Que paso", name: "que_paso", label: "Que te paso?", 
    items: [
      { title: "Robo", name: "robo", label: "Me robaron sin darme cuenta" },
      { title: "Agresion", name: "agresion", label: "Me agredieron" },
      { title: "Robo violento", name: "robo_violento", label: "Me robaron violentamente" }
    ]
  },
  { title: "Que arrebataron", name: "que_arrebataron", label: "Que te arrebataron?", 
    items: [
      { title: "Celular", name: "celular", label: "Celular" },
      { title: "Pasaporte", name: "pasaporte", label: "Pasaporte" },
      { title: "Cedula de identidad", name: "cedula_de_identiddad", label: "Cedula de identidad" },
      { title: "Credencial", name: "credencial", label: "Credencial" },
      { title: "Tarjeta bus", name: "tarjeta_bus", label: "Tarjeta de transporte" },
      { title: "Libreta de conducir", name: "libreta_conducir", label: "Libreta de conducir" },
      { title: "Tarjetas de banco", name: "tarjetas_banco", label: "Tarjetas banco" },
      { title: "Tarjetas de credito", name: "tarjetas_de_credito", label: "Tarjetas de credito" },
      { title: "Libreta de conducir", name: "libreta_conducir", label: "Libreta de conducir" }
    ]
  }
]

questions.each do |data|
  q = Question.new(title:data[:title], name:data[:name], label:data[:label])
  q.save
  data[:items].each do |item|
    item = Item.new(title:item[:title], name:item[:name], label:item[:label])
    item.save
    q.add_item(item)
    q.save
  end
end
