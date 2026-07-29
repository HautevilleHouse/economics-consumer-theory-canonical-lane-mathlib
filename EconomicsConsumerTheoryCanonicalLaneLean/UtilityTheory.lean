import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure UtilityRepresentationPackage where
  consumptionSet : Type u
  preferenceRelation : consumptionSet → consumptionSet → Prop
  utilityFunction : consumptionSet → ℝ
  completeness : ∀ x y, preferenceRelation x y ∨ preferenceRelation y x
  transitivity : ∀ x y z, preferenceRelation x y → preferenceRelation y z → preferenceRelation x z
  representation : ∀ x y, preferenceRelation x y ↔ utilityFunction x ≥ utilityFunction y

structure UtilityRepresentationEvidence (U : UtilityRepresentationPackage) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  representationClosed : U.representation

def UtilityRepresentationClosed (U : UtilityRepresentationPackage) : Prop :=
  U.completeness ∧ U.transitivity ∧ U.representation

theorem utility_representation_closed_from_evidence (U : UtilityRepresentationPackage)
    (E : UtilityRepresentationEvidence U) : UtilityRepresentationClosed U := by
  exact And.intro E.completenessClosed (And.intro E.transitivityClosed E.representationClosed)

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse