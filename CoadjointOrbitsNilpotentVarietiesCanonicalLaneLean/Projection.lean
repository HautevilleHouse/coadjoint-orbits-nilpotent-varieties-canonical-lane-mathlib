import CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def coadjointProjection : Projection CoadjointEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem coadjoint_projection_idempotent (x : CoadjointEndgameState) :
    coadjointProjection.toFun (coadjointProjection.toFun x) = coadjointProjection.toFun x := by
  exact coadjointProjection.idempotent x

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
