import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure LucasAssetPricingPackage where
  stateSpace : Type u
  dividendProcess : stateSpace → ℝ
  pricingKernel : stateSpace → stateSpace → ℝ
  representativeAgentUtility : ℝ → ℝ
  discountFactor : ℝ
  equilibriumPrice : stateSpace → ℝ
  eulerEquation : Prop

structure LucasAssetPricingEvidence (L : LucasAssetPricingPackage) where
  eulerEquationClosed : L.eulerEquation

def LucasAssetPricingClosed (L : LucasAssetPricingPackage) : Prop :=
  L.eulerEquation

theorem lucas_asset_pricing_closed_from_evidence (L : LucasAssetPricingPackage)
    (E : LucasAssetPricingEvidence L) : LucasAssetPricingClosed L := by
  exact E.eulerEquationClosed

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse