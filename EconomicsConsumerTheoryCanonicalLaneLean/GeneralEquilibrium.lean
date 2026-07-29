import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure GeneralEquilibriumPackage where
  arrowDebreuCommoditySpace : Type u
  priceSpace : Type v
  excessDemandContinuous : Prop
  walrasLawValid : Prop
  fixedPointExists : Prop
  equilibriumPriceVector : Prop

structure GeneralEquilibriumEvidence (G : GeneralEquilibriumPackage) where
  excessDemandContinuousClosed : G.excessDemandContinuous
  walrasLawValidClosed : G.walrasLawValid
  fixedPointExistsClosed : G.fixedPointExists
  equilibriumPriceVectorClosed : G.equilibriumPriceVector

def GeneralEquilibriumClosed (G : GeneralEquilibriumPackage) : Prop :=
  G.excessDemandContinuous ∧ G.walrasLawValid ∧ G.fixedPointExists ∧ G.equilibriumPriceVector

theorem general_equilibrium_closed_from_evidence (G : GeneralEquilibriumPackage)
    (E : GeneralEquilibriumEvidence G) : GeneralEquilibriumClosed G := by
  exact And.intro E.excessDemandContinuousClosed
    (And.intro E.walrasLawValidClosed
      (And.intro E.fixedPointExistsClosed E.equilibriumPriceVectorClosed))

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse