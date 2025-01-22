library(haven)
Fotos_Gabriel <- read_sav("Datos/Fotos_Gabriel.sav")

mod1 <- lm(SBISS_post~SBISS_pre, data= Fotos_Gabriel) #Primer modelo
summary(mod1)
lmtest::reset(mod1) #Prueba linealidad
lmtest::bptest(mod1) #Prueba homocedasticidad
ks.test(residuals(mod1), pnorm, mean(residuals(mod1)), sd(residuals(mod1))) #Prueba normalidad

mod2<- lm(SBISS_post~SBISS_pre + EDI_BD + Age + BMI, data = Fotos_Gabriel) #Segundo modelo
summary(mod2)
lmtest::reset(mod2) #Prueba linealidad
lmtest::bptest(mod2) #Prueba homocedasticidad
ks.test(residuals(mod2), pnorm, mean(residuals(mod2)), sd(residuals(mod2))) #Prueba normalidad
