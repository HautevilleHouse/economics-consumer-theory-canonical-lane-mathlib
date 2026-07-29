import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsConsumerTheoryCanonicalLaneLean

structure ConsumerTheorySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ConsumerTheoryAdmittedObject where
  space : ConsumerTheorySpace
  compactConsumptionSet : Prop
  continuousPreferences : Prop
  locallyNonSatiated : Prop
  walrasLawHolds : Prop
  equilibriumExists : Prop
  conclusion : equilibriumExists

structure ConsumerTheoryEndgameState where
  object : ConsumerTheoryAdmittedObject

def ConsumerTheoryWitnessClosed (O : ConsumerTheoryAdmittedObject) : Prop :=
  O.equilibriumExists

end EconomicsConsumerTheoryCanonicalLaneLean
end HautevilleHouse