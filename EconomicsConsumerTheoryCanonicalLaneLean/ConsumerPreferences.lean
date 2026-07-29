import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure ConsumerPreferences (X : Type u) where
  preferenceRelation : X → X → Prop
  completeness : ∀ x y : X, preferenceRelation x y ∨ preferenceRelation y x
  transitivity : ∀ x y z : X, preferenceRelation x y → preferenceRelation y z → preferenceRelation x z
  reflexivity : ∀ x : X, preferenceRelation x x

def ConsumerPreferencesClosed (P : ConsumerPreferences X) : Prop :=
  P.completeness ∧ P.transitivity ∧ P.reflexivity

theorem consumer_preferences_closed_from_evidence (P : ConsumerPreferences X) :
    ConsumerPreferencesClosed P := by
  exact And.intro P.completeness (And.intro P.transitivity P.reflexivity)

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse