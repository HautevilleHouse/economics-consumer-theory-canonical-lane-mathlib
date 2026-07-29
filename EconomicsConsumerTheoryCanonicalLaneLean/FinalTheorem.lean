import EconomicsConsumerTheoryCanonicalLaneLean.BridgeLemmas
import EconomicsConsumerTheoryCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

def ConstrainedConsumerTheoryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_consumer_theory_endgame (A : AdmissibleClass) :
    ConstrainedConsumerTheoryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse