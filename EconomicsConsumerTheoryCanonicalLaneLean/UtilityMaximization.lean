import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure UtilityMaximizationPackage where
  consumptionSet : Type u
  preferenceRelation : Type v
  utilityFunctionExists : Prop
  demandCorrespondenceDefined : Prop
  budgetConstraint : Prop
  marshallianDemandExists : Prop

structure UtilityMaximizationEvidence (U : UtilityMaximizationPackage) where
  utilityFunctionExistsClosed : U.utilityFunctionExists
  demandCorrespondenceDefinedClosed : U.demandCorrespondenceDefined
  budgetConstraintClosed : U.budgetConstraint
  marshallianDemandExistsClosed : U.marshallianDemandExists

def UtilityMaximizationClosed (U : UtilityMaximizationPackage) : Prop :=
  U.utilityFunctionExists ∧ U.demandCorrespondenceDefined ∧ U.budgetConstraint ∧ U.marshallianDemandExists

theorem utility_maximization_closed_from_evidence (U : UtilityMaximizationPackage)
    (E : UtilityMaximizationEvidence U) : UtilityMaximizationClosed U := by
  exact And.intro E.utilityFunctionExistsClosed
    (And.intro E.demandCorrespondenceDefinedClosed
      (And.intro E.budgetConstraintClosed E.marshallianDemandExistsClosed))

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse