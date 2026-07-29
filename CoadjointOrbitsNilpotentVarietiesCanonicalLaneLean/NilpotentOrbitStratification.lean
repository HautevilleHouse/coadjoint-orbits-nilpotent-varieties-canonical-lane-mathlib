import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarieties

structure NilpotentOrbitStratificationPackage where
  lieAlgebra : Type u
  nilpotentOrbits : Type v
  closurePartialOrder : Prop
  adjointGroupAction : Prop
  orbitClosureRelations : Prop
  rigidNilpotentOrbitsIdentified : Prop

def NilpotentOrbitStratificationClosed (N : NilpotentOrbitStratificationPackage) : Prop :=
  N.closurePartialOrder ∧ N.adjointGroupAction ∧ N.orbitClosureRelations ∧ N.rigidNilpotentOrbitsIdentified

end CoadjointOrbitsNilpotentVarieties
end HautevilleHouse
