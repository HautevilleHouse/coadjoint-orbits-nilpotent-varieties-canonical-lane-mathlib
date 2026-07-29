import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure NilpotentLieAlgebra where
  field : Type u
  bracket : field → field → field
  nilpotentIndex : ℕ
  jacobiIdentity : ∀ x y z : field, bracket x (bracket y z) + bracket y (bracket z x) + bracket z (bracket x y) = 0
  nilpotentCondition : ∀ x₁ x₂ ... xₙ : field, bracket x₁ (bracket x₂ (... (bracket xₙ₋₁ xₙ)...)) = 0
  vectorSpaceOverField : VectorSpace field
  lieAlgebraStructure : LieAlgebra field

structure NilpotentLieAlgebraEvidence (L : NilpotentLieAlgebra) where
  jacobiIdentityClosed : L.jacobiIdentity
  nilpotentConditionClosed : L.nilpotentCondition

def NilpotentLieAlgebraClosed (L : NilpotentLieAlgebra) : Prop := L.jacobiIdentity ∧ L.nilpotentCondition

theorem nilpotent_lie_algebra_closed_from_evidence (L : NilpotentLieAlgebra) (E : NilpotentLieAlgebraEvidence L) : NilpotentLieAlgebraClosed L := by
  exact And.intro E.jacobiIdentityClosed E.nilpotentConditionClosed

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
