library(evalITR)

test_that("Non Cross-Validated Functions Work", {
  T = c(1,0,1,0,1,0,1,0)
  That = c(0,1,1,0,0,1,1,0)
  That2 = c(1,0,0,1,1,0,0,1)
  tau = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7)
  Y = c(4,5,0,2,4,1,-4,3)
  papelist <- PAPE(T,That,Y)
  pavlist <- PAV(T,That,Y)
  papdlist <- PAPD(T,That,That2,Y,0.5)
  aupeclist <- AUPEC(T,tau,Y)
  expect_type(papelist,"list")
  expect_type(pavlist,"list")
  expect_type(papdlist,"list")
  expect_type(aupeclist,"list")
  expect_type(papelist$pape,"double")
  expect_type(pavlist$pav,"double")
  expect_type(papdlist$papd,"double")
  expect_type(aupeclist$aupec,"double")
  expect_type(papelist$sd,"double")
  expect_type(pavlist$sd,"double")
  expect_type(papdlist$sd,"double")
  expect_type(aupeclist$sd,"double")
})

test_that("Cross-Validated Functions Work", {
  T = c(1,0,1,0,1,0,1,0)
  That = matrix(c(0,1,1,0,0,1,1,0,1,0,0,1,1,0,0,1), nrow = 8, ncol = 2)
  That2 = matrix(c(0,0,1,1,0,0,1,1,1,1,0,0,1,1,0,0), nrow = 8, ncol = 2)
  tau = matrix(c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,-0.5,-0.3,-0.1,0.1,0.3,0.5,0.7,0.9),nrow = 8, ncol = 2)
  Y = c(4,5,0,2,4,1,-4,3)
  ind = c(rep(1,4),rep(2,4))
  papelist <- PAPEcv(T,That,Y,ind)
  pavlist <- PAVcv(T,That,Y,ind)
  papdlist <- PAPDcv(T,That,That2,Y,ind,plim = 0.5)
  aupeclist <- AUPECcv(T,tau,Y,ind)
  expect_type(papelist,"list")
  expect_type(pavlist,"list")
  expect_type(papdlist,"list")
  expect_type(aupeclist,"list")
  expect_type(papelist$pape,"double")
  expect_type(pavlist$pav,"double")
  expect_type(papdlist$papd,"double")
  expect_type(aupeclist$aupec,"double")
  expect_type(papelist$sd,"double")
  expect_type(pavlist$sd,"double")
  expect_type(papdlist$sd,"double")
  expect_type(aupeclist$sd,"double")
})

