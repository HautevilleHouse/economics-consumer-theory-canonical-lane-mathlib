import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure ArrowDebreuEconomy where
  consumers : Type u
  firms : Type v
  commodities : Nat
  endowments : consumers → ℝ^commodities
  preferences : consumers → UtilityRepresentation
  productionSets : firms → Set (ℝ^commodities)
  shares : consumers → firms → ℝ

structure ArrowDebreuEquilibrium where
  prices : ℝ^commodities
  allocations : consumers → ℝ^commodities
  productions : firms → ℝ^commodities
  marketClearing : (∑_{i} allocations i) = (∑_{i} endowments i) + (∑_{j} productions j)
  consumerOptimal : ∀ i, allocations i ∈ budgetSet prices endowments i ∧
    ∀ x ∈ budgetSet prices endowments i, preferences i x ≤ preferences i (allocations i)
  profitMaximizing : ∀ j, productions j ∈ productionSets j ∧
    ∀ y ∈ productionSets j, prices · y ≤ prices · (productions j)
  budgetSet (p : ℝ^commodities) (e : ℝ^commodities) : Set (ℝ^commodities) :=
    {x | p · x ≤ p · e}

structure ArrowDebreuEquilibriumEvidence (E : ArrowDebreuEconomy) (A : ArrowDebreuEquilibrium) where
  marketClearingClosed : A.marketClearing
  consumerOptimalClosed : A.consumerOptimal
  profitMaximizingClosed : A.profitMaximizing

def ArrowDebreuEquilibriumClosed (E : ArrowDebreuEconomy) (A : ArrowDebreuEquilibrium) : Prop :=
  A.marketClearing ∧ A.consumerOptimal ∧ A.profitMaximizing

theorem arrow_debreu_equilibrium_closed_from_evidence
    (E : ArrowDebreuEconomy) (A : ArrowDebreuEquilibrium)
    (Ev : ArrowDebreuEquilibriumEvidence E A) :
    ArrowDebreuEquilibriumClosed E A := by
  exact And.intro Ev.marketClearingClosed
    (And.intro Ev.consumerOptimalClosed Ev.profitMaximizingClosed)

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse