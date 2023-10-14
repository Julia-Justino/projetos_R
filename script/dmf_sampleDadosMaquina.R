#================Criação de dados=================
cpu <- sample(x = 1:100, size = 2000, replace = TRUE)
cpu1 <- sample(cpu, size = 200, replace = TRUE)
cpu2 <- sample(cpu, size = 200, replace = TRUE)
cpu3 <- sample(cpu, size = 200, replace = TRUE)

ram <- sample(x = 1:100, size = 2000, replace = TRUE)
ram1 <- sample(ram, size = 200, replace = TRUE)
ram2 <- sample(ram, size = 200, replace = TRUE)
ram3 <- sample(ram, size = 200, replace = TRUE)

disco <- sample(x = 1:100, size = 2000, replace = TRUE)
disco1 <- sample(disco, size = 200, replace = TRUE)
disco2 <- sample(disco, size = 200, replace = TRUE)
disco3 <- sample(disco, size = 200, replace = TRUE)

temp <- sample(x = 1:100, size = 2000, replace = TRUE)
temp1 <- sample(temp, size = 200, replace = TRUE)
temp2 <- sample(temp, size = 200, replace = TRUE)
temp3 <- sample(temp, size = 200, replace = TRUE)

#====================Exemplo=====================

#dados <- c( variável)
#variacaoDados <- dados - mean(dados)
#variacaoDados <- variacaoDados ^ 2
#variancia <- mean(variacaoDados)
#var(dados)
#variancia
#desvio <- sqrt(variancia)
#sd(dados)
#desvio

#===================Desvio de CPU=======================
dadosCPU <- c(cpu)
mediaCPU <- mean(dadosCPU)
variacaoDadosCPU <- dadosCPU - mean(dadosCPU)
variacaoDadosCPU <- variacaoDadosCPU ^ 2
varianciaCPU <- mean(variacaoDadosCPU)
varCPU<- var(dadosCPU)
desvioCPU<- sqrt(varianciaCPU)
sdCPU<- sd(dadosCPU)

#==================Desvio de RAM=======================

dadosRAM <- c(ram)
mediaRAM <- mean(dadosRAM)
variacaoDadosRAM <- dadosRAM - mean(dadosRAM)
variacaoDadosRAM <- variacaoDadosRAM ^ 2
varianciaRAM <- mean(variacaoDadosRAM)
varRAM<- var(dadosRAM)
desvioRAM<- sqrt(varianciaRAM)
sdRAM<- sd(dadosRAM)

#================Desvio de Disco=======================

dadosDISCO <- c(disco)
mediaDISCO <- mean(dadosDISCO)
variacaoDadosDISCO <- dadosDISCO - mean(dadosDISCO)
variacaoDadosDISCO <- variacaoDadosDISCO ^ 2
varianciaDISCO <- mean(variacaoDadosDISCO)
varDISCO<- var(dadosDISCO)
desvioDISCO<- sqrt(varianciaDISCO)
sdDISCO<- sd(dadosDISCO)

#===============Desvio de temperatura=================

dadosTEMPERATURA <- c(temp)
mediaTEMPERATURA <- mean(dadosTEMPERATURA)
variacaoDadosTEMPERATURA <- dadosTEMPERATURA - mean(dadosTEMPERATURA)
variacaoDadosTEMPERATURA <- variacaoDadosTEMPERATURA ^ 2
varianciaTEMPERATURA <- mean(variacaoDadosTEMPERATURA)
varTEMPERATURA<- var(dadosTEMPERATURA)
desvioTEMPERATURA<- sqrt(varianciaTEMPERATURA)
sdTEMPERATURA<- sd(dadosTEMPERATURA)

#================== Tabelas==============================

cpuTabela <- data.frame(mean = mediaCPU, var = varCPU,variancia = varianciaCPU, desvio = desvioCPU, sd = sdCPU)
ramTabela <- data.frame(mean = mediaRAM, var = varRAM,variancia = varianciaRAM, desvio = desvioRAM, sd = sdRAM)
discoTabela <- data.frame(mean = mediaDISCO, var = varDISCO,variancia = varianciaDISCO, desvio = desvioDISCO, sd = sdDISCO)
temperaturaTabela <- data.frame(mean = mediaTEMPERATURA, var = varTEMPERATURA,
                                variancia = varianciaTEMPERATURA, desvio = desvioTEMPERATURA, sd = sdTEMPERATURA)