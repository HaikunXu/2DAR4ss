#include <TMB.hpp>
template<class Type>
Type objective_function<Type>::operator() ()
{
  DATA_INTEGER(Nyears);
  DATA_INTEGER(Nages);
  DATA_MATRIX(SDev_hat);
   
  // =====================================================================

  PARAMETER( rho_a );
  PARAMETER( rho_t );
  PARAMETER( ln_SigmaS );
  // =====================================================================

  Type Rho_a = exp(rho_a)/(exp(rho_a) + 1);
  Type Rho_t = exp(rho_t)/(exp(rho_t) + 1);
  Type SigmaS = exp(ln_SigmaS);
  vector<Type> SDev_hat_vec(Nages*Nyears);

  matrix<Type> Sigma_a(Nages,Nages);
  matrix<Type> Sigma_t(Nyears,Nyears);
  matrix<Type> Sigma_tot(Nages*Nyears,Nages*Nyears);
  // =====================================================================

  // other global variables
  Type jnll = 0;
  
  for(int i=0; i<Nages; ++i) Sigma_a(i,i) = 1;
  
  for(int i=0; i<Nages; ++i){
	for(int j=0; j<i; ++j){
		Sigma_a(i,j)=pow(Rho_a, std::abs(i-j));
        Sigma_a(j,i)=Sigma_a(i,j);
    }
  }
  
  for(int i=0; i<Nyears; ++i) Sigma_t(i,i) = 1;
  
  for(int i=0; i<Nyears; ++i){
	for(int j=0; j<i; ++j){
		Sigma_t(i,j)=pow(Rho_t, std::abs(i-j));
        Sigma_t(j,i)=Sigma_t(i,j);
    }
  }
  
  Sigma_tot = kronecker(Sigma_t,Sigma_a)*SigmaS*SigmaS;
  
  int i = 0;
  for(int t = 0; t < Nyears; t++) 
  {
    for(int a = 0; a < Nages; a++) 
    {
      SDev_hat_vec(i) = SDev_hat(a,t);
	  i++;
    }
  }
  
  using namespace density;
  MVNORM_t<Type> nll_MVN_S(Sigma_tot);
  jnll += nll_MVN_S(SDev_hat_vec); 
  
  // ===========================================================================
  REPORT(Rho_a);
  REPORT(Rho_t);
  return jnll;
}

