# Crie um vetor de nomes de chamados
chamados <- c("dashboard_não_aparece", "dashboard_travado", "temperatura_elevada", "CPU_consumo_elevado", "aplicação_lenta", "upload_lento", "download_lento", "memoria_cheia", "alerta_dispara", "dados_incorretos", "disco_consumo_elevado", "usuario_não_pode_ser_cadastrado", "maquina_não_pode_ser_cadastrada", "login_não_funciona")
chamadosDf<-data.frame(chamados)

dns<-sample(c(chamadosDf$chamados[1], chamadosDf$chamados[6]))

vinte<-sample(c(chamadosDf$chamados[7], chamadosDf$chamados[8], chamadosDf$chamados[9], 
                chamadosDf$chamados[10], chamadosDf$chamados[11], chamadosDf$chamados[13], chamadosDf$chamados[14]))
dt<-sample(chamadosDf$chamados[2])
te<-sample(chamadosDf$chamados[3])
cpuCe<-sample(chamadosDf$chamados[4])
al<- sample(chamadosDf$chamados[5])
ca<-sample(chamadosDf$chamados[12])

vinte<-rep(vinte, 20)
dns_re<-rep(dns, 60)
dt<-rep(dt, 160)
te<-rep(te, 120)
cpuCe<-rep(cpuCe, 80)
al<-rep(al,100)
ca<-rep(ca,40)


length(ca)
