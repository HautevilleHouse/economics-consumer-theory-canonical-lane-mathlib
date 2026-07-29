import EconomicsConsumerTheoryCanonicalLaneLean.UtilityRepresentation

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure CompetitiveEquilibriumPackage where
  priceVector : ℝ → ℝ
  allocation : ConsumerTheoryAdmittedObject → ℝ
  marketClearing : ∀ good, totalDemand good = totalSupply good
  utilityMaximization : ∀ consumer, allocation consumer maximizes utilityFunction given budget

structure CompetitiveEquilibriumEvidence (E : CompetitiveEquilibriumPackage) where
  marketClearingClosed : E.marketClearing
  utilityMaximizationClosed : E.utilityMaximization

def CompetitiveEquilibriumClosed (E : CompetitiveEquilibriumPackage) : Prop :=
  E.marketClearing ∧ E.utilityMaximization

theorem competitive_equilibrium_closed_from_evidence
    (E : CompetitiveEquilibriumPackage) (Ev : CompetitiveEquilibriumEvidence E) :
    CompetitiveEquilibriumClosed E := by
  exact And.intro Ev.marketClearingClosed Ev.utilityMaximizationClosed

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse