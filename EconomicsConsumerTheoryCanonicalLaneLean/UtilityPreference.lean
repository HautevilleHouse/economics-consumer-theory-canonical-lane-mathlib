import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure UtilityRepresentation where
  preference : Type u
  consumptionSet : Type v
  utilityFunction : consumptionSet → ℝ
  complete : Prop
  transitive : Prop
  continuous : Prop
  strictlyMonotonic : Prop
  strictlyConvex : Prop
  completeTerm : complete
  transitiveTerm : transitive
  continuousTerm : continuous
  strictlyMonotonicTerm : strictlyMonotonic
  strictlyConvexTerm : strictlyConvex

structure UtilityRepresentationEvidence (U : UtilityRepresentation) where
  completeClosed : U.complete
  transitiveClosed : U.transitive
  continuousClosed : U.continuous
  strictlyMonotonicClosed : U.strictlyMonotonic
  strictlyConvexClosed : U.strictlyConvex

def UtilityRepresentationClosed (U : UtilityRepresentation) : Prop :=
  U.complete ∧ U.transitive ∧ U.continuous ∧ U.strictlyMonotonic ∧ U.strictlyConvex

theorem utility_representation_closed_from_evidence
    (U : UtilityRepresentation) (E : UtilityRepresentationEvidence U) :
    UtilityRepresentationClosed U := by
  exact And.intro E.completeClosed
    (And.intro E.transitiveClosed
      (And.intro E.continuousClosed
        (And.intro E.strictlyMonotonicClosed E.strictlyConvexClosed)))

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse