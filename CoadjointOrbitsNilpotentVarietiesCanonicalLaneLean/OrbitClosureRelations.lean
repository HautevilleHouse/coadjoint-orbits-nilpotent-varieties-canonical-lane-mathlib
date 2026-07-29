import CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.NilpotentVarietyClassification

/-!
# Orbit Closure Relations Package
-/

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure OrbitClosureRelations (O : CoadjointOrbitStructure) (N : NilpotentVarietyClassification O) where
  closureOrder : Type u
  inclusionRelation : Type v
  orbitBoundaries : Type w
  closureOrderPartialOrder : Prop
  inclusionRelationTranslates : Prop
  orbitBoundariesNilpotent : orbitBoundaries → Prop
  closureOrderPartialOrderClosed : closureOrderPartialOrder
  inclusionRelationTranslatesClosed : inclusionRelationTranslates
  orbitBoundariesNilpotentClosed : (b : orbitBoundaries) → orbitBoundariesNilpotent b

structure OrbitClosureEvidence (O : CoadjointOrbitStructure) (N : NilpotentVarietyClassification O) (R : OrbitClosureRelations O N) where
  closureOrderPartialOrderClosed : R.closureOrderPartialOrderClosed
  inclusionRelationTranslatesClosed : R.inclusionRelationTranslatesClosed
  orbitBoundariesNilpotentClosed : ∀ (b : R.orbitBoundaries), R.orbitBoundariesNilpotent b

def OrbitClosureRelationsClosed (O : CoadjointOrbitStructure) (N : NilpotentVarietyClassification O) (R : OrbitClosureRelations O N) : Prop :=
  R.closureOrderPartialOrder ∧ R.inclusionRelationTranslates ∧ (∀ (b : R.orbitBoundaries), R.orbitBoundariesNilpotent b)

theorem orbit_closure_relations_closed_from_evidence (O : CoadjointOrbitStructure) (N : NilpotentVarietyClassification O) (R : OrbitClosureRelations O N) (E : OrbitClosureEvidence O N R) :
    OrbitClosureRelationsClosed O N R := by
  refine And.intro ?_ (And.intro ?_ ?_)
  · exact R.closureOrderPartialOrderClosed
  · exact R.inclusionRelationTranslatesClosed
  · exact E.orbitBoundariesNilpotentClosed

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
