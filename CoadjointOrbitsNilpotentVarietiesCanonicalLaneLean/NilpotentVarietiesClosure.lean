import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.NilpotentLieAlgebra
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.CoadjointOrbitStructure
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.NilpotentOrbitClassification
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.KirillovCharacterFormula
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.GeometricQuantization

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := NilpotentLieAlgebraClosed (A.object : NilpotentLieAlgebra)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop := A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedNilpotentVarietiesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_nilpotent_varieties_endgame (A : AdmissibleClass) : ConstrainedNilpotentVarietiesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
