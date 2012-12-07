require File.expand_path('../../config/boot.rb', __FILE__)
require 'padrino-core/cli/rake'
PadrinoTasks.init

questions = [
  { title: "Sexo victima", name: "sexo_victima", label: "Sos hombre o mujer?", order: 1,
    items: [
      { title: "Hombre", name: "victima_hombre", label: "Hombre" },
      { title: "Mujer", name: "victima_mujer", label: "Mujer" }
    ]
  },
  { title: "Que paso", name: "que_paso", label: "Que te paso?", order: 2,
    items: [
      { title: "Robo", name: "robo", label: "Me robaron sin darme cuenta" },
      { title: "Agresion", name: "agresion", label: "Me agredieron" },
      { title: "Robo violento", name: "robo_violento", label: "Me robaron violentamente" }
    ]
  },
  { title: "Perpetradores", name: "perpetradores", label: "Quien/quienes te atacaron?", order: 4, 
    items: [
      { title: "Perpetrador Hombre", name: "perpetrador_hombre", label: "Un hombre" },
      { title: "Perpetrador Mujer", name: "perptrador_mujer", label: "Una mujer" },
      { title: "Perpetradores varios Hombre", name: "perptradores_hombres", label: "Varios hombres" },
      { title: "Perpetradores varios Mujer", name: "perptradores_mujer", label: "Varias mujeres" },
      { title: "Perpetrador varios", name: "perptradores_varios", label: "Varias personas de dferente sexo" },
    ]
  },
  { title: "Que arrebataron", name: "que_arrebataron", label: "Que te arrebataron?", order: 5, is_multi_option: true,
    items: [
      { title: "Celular", name: "celular", label: "Celular" },
      { title: "Pasaporte", name: "pasaporte", label: "Pasaporte" },
      { title: "Cedula de identidad", name: "cedula_de_identiddad", label: "Cedula de identidad" },
      { title: "Credencial", name: "credencial", label: "Credencial" },
      { title: "Tarjeta bus", name: "tarjeta_bus", label: "Tarjeta de transporte" },
      { title: "Libreta de conducir", name: "libreta_conducir", label: "Libreta de conducir" },
      { title: "Tarjetas de banco", name: "tarjetas_banco", label: "Tarjetas banco" },
      { title: "Tarjetas de credito", name: "tarjetas_de_credito", label: "Tarjetas de credito" },
      { title: "Libreta de conducir", name: "libreta_conducir", label: "Libreta de conducir" },
      { title: "Llaves", name: "llaves", label: "Llaves" }
    ]
  },
  { title: "Utilizaron algun arma", name: "arma", label: "Se utilizo algun tipo de arma?", order: 6,
    items: [
      { title: "Arma Blanca", name: "arma_blanca", label: "Arma blanca" },
      { title: "Arma de Fuego", name: "arma_de_fuego", label: "Arma de fuego" }
    ]
  },
  { title: "Testigos", name: "testigos", label: "Habia alguien cerca?", order: 7,
    items: [
      { title: "Un amigox", name: "un_amigo_testigo", label: "Si, un amigo/a", suggestion: "Es posible que tu amigo pueda ser llamado como testigo, deberias comentarselo y preguntarle si esta dispuesto a hacerlo, en el caso de que sea necesario" },
      { title: "Varios conocidos", name: "varios_testigos_conocidos", label: "Si, habian varios conocidos", suggestion: "Es posible que tus amigos puedan ser llamados como testigos, deberias comentarselo y preguntarles si estarian dispuestos a hacerlo, en el caso de que sea necesario" },
      { title: "Desconocidos", name: "testigos_desconocidos", label: "Si, habia otras personas pero no las conocia", suggestion: "Es probable que la policia te pregunte sobre como eran las personas que presenciaron el incidente. Seria de utilidad que anotes todo lo que recuerdes de ellos si es que tienes pensado ir mas tarde u otro dia." },
      { title: "Solo", name: "sin_testigos", label: "No, estaba solo" }
    ]
  }
]

def save_edit_items(items, question)
  items.each do |item|
    item = Item.where(name: item[:name]).first
    if item
      puts "Updating item #{item[:name]}"
      item.update_all(title:item[:title], name:item[:name], label:item[:label], suggestion:item[:suggestion])
      item.save
    else
      puts "Creating item #{item[:name]}"
      item = Item.new(title:item[:title], name:item[:name], label:item[:label], suggestion:item[:suggestion])
      item.save
      question.add_item(item)
      question.save
    end
  end
end

questions.each do |data|
  question = Question.where(name:data[:name]).first
  if question 
    puts "Updating question #{data[:name]}"
    question.update_all(title:data[:title], name:data[:name], label:data[:label], is_multi_option:data[:is_multi_option], order:data[:order])
    question.save
  else
    puts "Creating question #{data[:name]}"
    question = Question.new(title:data[:title], name:data[:name], label:data[:label], is_multi_option:data[:is_multi_option], order:data[:order])
    question.save
  end
  save_edit_items(data[:items],question)
end
