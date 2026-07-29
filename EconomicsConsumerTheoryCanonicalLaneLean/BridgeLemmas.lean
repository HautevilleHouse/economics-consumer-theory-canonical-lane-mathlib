import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ConsumerTheoryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse