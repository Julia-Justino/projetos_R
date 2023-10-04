nome <- readline(prompt = "Digite seu nome: ")
peso<- readline(prompt = "Digite seu peso: ")
peso <-as.integer(peso)
altura <- readline(prompt = "Digite sua altura: ")
altura <- as.double(altura)
IMC <- round(peso/(altura**2))
if(IMC < 18.5){
  print(IMC)
  print('Diagnóstico: Abaixo do peso normal 🟨') 
} else if(IMC >=18.5 && IMC <25){
  print(IMC)
  print('Diagnóstico: peso normal 🟩')
}else if(IMC >=25 && IMC <30){
  print('Diagnóstico: Acima do peso ideal 🟨')
}else if(IMC >=30 && IMC <35){
  print('Diagnóstico: Obsidade grau 1 🟧') 
}else if(IMC >=35 && IMC <40){
  print('Diagnóstico: obeso 2 (Obsidade severa)🟫') 
}else if(IMC >= 40){
  print('Diagnóstico: obesidade 3 (mórbida)🟥') 
}
print(IMC)