import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure WelfareTheoremsPackage where
  competitiveEquilibrium : Prop
  paretoOptimalAllocation : Prop
  firstWelfareTheorem : Prop
  secondWelfareTheorem : Prop
  lumpSumTransfersExist : Prop

structure WelfareTheoremsEvidence (W : WelfareTheoremsPackage) where
  competitiveEquilibriumClosed : W.competitiveEquilibrium
  paretoOptimalAllocationClosed : W.paretoOptimalAllocation
  firstWelfareTheoremClosed : W.firstWelfareTheorem
  secondWelfareTheoremClosed : W.secondWelfareTheorem
  lumpSumTransfersExistClosed : W.lumpSumTransfersExist

def WelfareTheoremsClosed (W : WelfareTheoremsPackage) : Prop :=
  W.competitiveEquilibrium ∧ W.paretoOptimalAllocation ∧ W.firstWelfareTheorem ∧
  W.secondWelfareTheorem ∧ W.lumpSumTransfersExist

theorem welfare_theorems_closed_from_evidence (W : WelfareTheoremsPackage)
    (E : WelfareTheoremsEvidence W) : WelfareTheoremsClosed W := by
  exact And.intro E.competitiveEquilibriumClosed
    (And.intro E.paretoOptimalAllocationClosed
      (And.intro E.firstWelfareTheoremClosed
        (And.intro E.secondWelfareTheoremClosed E.lumpSumTransfersExistClosed)))

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse