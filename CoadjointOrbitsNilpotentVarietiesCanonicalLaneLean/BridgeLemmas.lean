import CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CoadjointWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
