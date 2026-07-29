import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure RamseyCassKoopmansPackage where
  capitalStock : Type u
  productionFunction : capitalStock → ℝ
  consumptionPath : ℕ → ℝ
  capitalAccumulation : ℕ → capitalStock → capitalStock
  utilityDiscount : ℝ
  initialCapital : capitalStock
  feasibility : ℕ → Prop
  optimality : Prop

structure RamseyCassKoopmansEvidence (R : RamseyCassKoopmansPackage) where
  feasibilityClosed : ∀ t, R.feasibility t
  optimalityClosed : R.optimality

def RamseyCassKoopmansClosed (R : RamseyCassKoopmansPackage) : Prop :=
  (∀ t, R.feasibility t) ∧ R.optimality

theorem ramsey_cass_koopmans_closed_from_evidence (R : RamseyCassKoopmansPackage)
    (E : RamseyCassKoopmansEvidence R) : RamseyCassKoopmansClosed R := by
  exact And.intro E.feasibilityClosed E.optimalityClosed

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse