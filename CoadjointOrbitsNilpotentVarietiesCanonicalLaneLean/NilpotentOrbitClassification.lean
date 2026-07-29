import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.CoadjointOrbitStructure

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure NilpotentOrbitClassification (L : NilpotentLieAlgebra) where
  nilpotentOrbits : Set (CoadjointOrbit L L.field)
  partitionByDimension : Prop
  correspondenceWithPartitions : Prop
  orbitClosureRelations : Prop
  dimensionFormulae : Prop
  specialOrbits : Prop

structure NilpotentOrbitClassificationEvidence {L : NilpotentLieAlgebra} (N : NilpotentOrbitClassification L) where
  partitionByDimensionClosed : N.partitionByDimension
  correspondenceWithPartitionsClosed : N.correspondenceWithPartitions
  orbitClosureRelationsClosed : N.orbitClosureRelations
  dimensionFormulaeClosed : N.dimensionFormulae
  specialOrbitsClosed : N.specialOrbits

def NilpotentOrbitClassificationClosed {L : NilpotentLieAlgebra} (N : NilpotentOrbitClassification L) : Prop :=
  N.partitionByDimension ∧ N.correspondenceWithPartitions ∧ N.orbitClosureRelations ∧ N.dimensionFormulae ∧ N.specialOrbits

theorem nilpotent_orbit_classification_closed {L : NilpotentLieAlgebra} (N : NilpotentOrbitClassification L) (E : NilpotentOrbitClassificationEvidence N) : NilpotentOrbitClassificationClosed N := by
  exact And.intro E.partitionByDimensionClosed (And.intro E.correspondenceWithPartitionsClosed (And.intro E.orbitClosureRelationsClosed (And.intro E.dimensionFormulaeClosed E.specialOrbitsClosed)))

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
