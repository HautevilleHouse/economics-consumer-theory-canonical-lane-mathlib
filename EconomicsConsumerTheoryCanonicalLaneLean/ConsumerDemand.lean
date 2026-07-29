import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure ConsumerDemandPackage where
  consumptionSet : Type u
  priceSpace : Type v
  wealthSpace : Type w
  demandCorrespondence : priceSpace -> wealthSpace -> Set (consumptionSet)
  walrasLaw : Prop
  homogeneityOfDegreeZero : Prop
  weakAxiomOfRevealedPreference : Prop
  SlutskyMatrixNegativeSemidefinite : Prop
  symmetryOfSlutskyMatrix : Prop

structure ConsumerDemandEvidence (D : ConsumerDemandPackage) where
  walrasLawClosed : D.walrasLaw
  homogeneityClosed : D.homogeneityOfDegreeZero
  warpClosed : D.weakAxiomOfRevealedPreference
  slutskyNegClosed : D.SlutskyMatrixNegativeSemidefinite
  slutskySymClosed : D.symmetryOfSlutskyMatrix

def ConsumerDemandClosed (D : ConsumerDemandPackage) : Prop :=
  D.walrasLaw ∧ D.homogeneityOfDegreeZero ∧ D.weakAxiomOfRevealedPreference ∧
  D.SlutskyMatrixNegativeSemidefinite ∧ D.symmetryOfSlutskyMatrix

theorem consumer_demand_closed_from_evidence (D : ConsumerDemandPackage)
    (E : ConsumerDemandEvidence D) : ConsumerDemandClosed D := by
  exact And.intro E.walrasLawClosed (And.intro E.homogeneityClosed
    (And.intro E.warpClosed (And.intro E.slutskyNegClosed E.slutskySymClosed)))

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse