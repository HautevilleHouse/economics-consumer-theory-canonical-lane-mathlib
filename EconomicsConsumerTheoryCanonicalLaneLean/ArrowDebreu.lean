import EconomicsConsumerTheoryCanonicalLaneLean.WelfareTheorems

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure ArrowDebreuEconomy where
  consumers : List ConsumerTheoryAdmittedObject
  firms : List Type
  initialEndowments : ConsumerTheoryAdmittedObject → ℝ
  productionSets : List (Type → ℝ)

structure ArrowDebreuEquilibriumPackage where
  economy : ArrowDebreuEconomy
  priceVector : ℝ → ℝ
  consumptionAllocation : List (ConsumerTheoryAdmittedObject → ℝ)
  productionAllocation : List (Type → ℝ)
  consumerOptimality : ∀ i, consumptionAllocation[i] maximizes utilityFunction given budget
  firmProfitMaximization : ∀ j, productionAllocation[j] maximizes profit given prices
  marketClearing : ∀ good, totalDemand = totalSupply

structure ArrowDebreuEvidence (A : ArrowDebreuEquilibriumPackage) where
  consumerOptimalityClosed : A.consumerOptimality
  firmProfitMaximizationClosed : A.firmProfitMaximization
  marketClearingClosed : A.marketClearing

def ArrowDebreuEquilibriumClosed (A : ArrowDebreuEquilibriumPackage) : Prop :=
  A.consumerOptimality ∧ A.firmProfitMaximization ∧ A.marketClearing

theorem arrow_debreu_equilibrium_closed_from_evidence
    (A : ArrowDebreuEquilibriumPackage) (E : ArrowDebreuEvidence A) :
    ArrowDebreuEquilibriumClosed A := by
  exact And.intro E.consumerOptimalityClosed
    (And.intro E.firmProfitMaximizationClosed E.marketClearingClosed)

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse