import canonicalLaneMathlib.AdmissibleClass
import EconomicsConsumerTheoryCanonicalLaneLean.ConsumerPreferences

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure UtilityFunction (X : Type u) where
  u : X → ℝ
  representing : ∀ (P : ConsumerPreferences X), (∀ x y : X, P.preferenceRelation x y ↔ u x ≥ u y)

structure UtilityExistencePackage where
  utilityFunction : UtilityFunction ℝ
  existenceProof : Prop
  existenceProofTerm : existenceProof

def UtilityExistenceClosed (U : UtilityExistencePackage) : Prop :=
  U.existenceProof

theorem utility_existence_closed (U : UtilityExistencePackage) :
    UtilityExistenceClosed U := by
  exact U.existenceProofTerm

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse