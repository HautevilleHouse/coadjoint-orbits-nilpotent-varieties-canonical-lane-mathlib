import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure CoadjointOrbitPackage where
  lieAlgebra : Type u
  dualSpace : Type v
  coadjointAction : lieAlgebra → dualSpace → dualSpace
  orbit : dualSpace → Set dualSpace
  orbitSmooth : Prop
  orbitSymplectic : Prop
  orbitClosure : Prop

structure CoadjointOrbitEvidence (C : CoadjointOrbitPackage) where
  orbitSmoothClosed : C.orbitSmooth
  orbitSymplecticClosed : C.orbitSymplectic
  orbitClosureClosed : C.orbitClosure

def CoadjointOrbitClosed (C : CoadjointOrbitPackage) : Prop :=
  C.orbitSmooth ∧ C.orbitSymplectic ∧ C.orbitClosure

theorem coadjoint_orbit_closed_from_evidence (C : CoadjointOrbitPackage)
    (E : CoadjointOrbitEvidence C) : CoadjointOrbitClosed C := by
  exact And.intro E.orbitSmoothClosed
    (And.intro E.orbitSymplecticClosed E.orbitClosureClosed)

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
