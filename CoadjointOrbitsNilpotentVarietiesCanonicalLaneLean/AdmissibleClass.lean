import CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure AdmissibleClass where
  object : CoadjointAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CoadjointWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
