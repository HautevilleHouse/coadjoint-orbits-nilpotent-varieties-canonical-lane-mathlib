import CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

def ConstrainedCoadjointClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_coadjoint_endgame (A : AdmissibleClass) :
    ConstrainedCoadjointClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
