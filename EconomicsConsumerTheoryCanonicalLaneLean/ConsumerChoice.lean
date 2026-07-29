import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure ConsumerChoicePackage where
  consumptionSet : Type u
  priceVector : consumptionSet → ℝ
  wealth : ℝ
  utilityFunction : consumptionSet → ℝ
  budgetSet : Set consumptionSet
  marshallianDemand : consumptionSet
  indirectUtility : ℝ
  walrasLaw : Prop
  homogeneity : Prop
  slutskyMatrix : Type v

structure ConsumerChoiceEvidence (C : ConsumerChoicePackage) where
  walrasLawClosed : C.walrasLaw
  homogeneityClosed : C.homogeneity

def ConsumerChoiceClosed (C : ConsumerChoicePackage) : Prop :=
  C.walrasLaw ∧ C.homogeneity

theorem consumer_choice_closed_from_evidence (C : ConsumerChoicePackage)
    (E : ConsumerChoiceEvidence C) : ConsumerChoiceClosed C := by
  exact And.intro E.walrasLawClosed E.homogeneityClosed

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse