import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure HamiltonianAction {G : Type u} [LieGroup G] (M : Type v) [TopologicalSpace M] where
  action : G → M → M
  momentMap : M → DualLieAlgebra G
  equivariance : Prop
  closedness : Prop

structure MomentMapPackage {G : Type u} [LieGroup G]
    (N : NilpotentVariety G) where
  symplecticForm : KostantKirillovFormPackage G N
  hamiltonianAction : HamiltonianAction G (CoadjointOrbit G)
  momentMapEquivariant : hamiltonianAction.equivariance
  momentMapClosed : hamiltonianAction.closedness

structure MomentMapEvidence {G : Type u} [LieGroup G]
    {N : NilpotentVariety G} (M : MomentMapPackage N) where
  momentMapEquivariantClosed : M.momentMapEquivariant
  momentMapClosedClosed : M.momentMapClosed

def MomentMapClosed {G : Type u} [LieGroup G]
    {N : NilpotentVariety G} (M : MomentMapPackage N) : Prop :=
  M.momentMapEquivariant ∧ M.momentMapClosed

theorem moment_map_closed_from_evidence
    {G : Type u} [LieGroup G] {N : NilpotentVariety G}
    (M : MomentMapPackage N) (E : MomentMapEvidence M) :
    MomentMapClosed M := by
  exact And.intro E.momentMapEquivariantClosed E.momentMapClosedClosed

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse