import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure CoadjointOrbit {G : Type u} [LieGroup G] where
  element : DualLieAlgebra G
  stabilizer : LieSubalgebra ℝ (LieAlgebra G)

structure NilpotentVariety {G : Type u} [LieGroup G] where
  orbits : Set (CoadjointOrbit G)
  closureConditions : Prop
  isNilpotent : Prop

structure StratificationPackage {G : Type u} [LieGroup G]
    (N : NilpotentVariety G) where
  orbitTypes : Type v
  partialOrder : orbitTypes → orbitTypes → Prop
  strata : orbitTypes → Set (CoadjointOrbit G)
  coveringCondition : Prop
  frontierCondition : Prop

structure StratificationEvidence {G : Type u} [LieGroup G]
    {N : NilpotentVariety G} (S : StratificationPackage N) where
  coveringConditionClosed : S.coveringCondition
  frontierConditionClosed : S.frontierCondition

def StratificationClosed {G : Type u} [LieGroup G]
    {N : NilpotentVariety G} (S : StratificationPackage N) : Prop :=
  S.coveringCondition ∧ S.frontierCondition

theorem stratification_closed_from_evidence
    {G : Type u} [LieGroup G] {N : NilpotentVariety G}
    (S : StratificationPackage N) (E : StratificationEvidence S) :
    StratificationClosed S := by
  exact And.intro E.coveringConditionClosed E.frontierConditionClosed

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse