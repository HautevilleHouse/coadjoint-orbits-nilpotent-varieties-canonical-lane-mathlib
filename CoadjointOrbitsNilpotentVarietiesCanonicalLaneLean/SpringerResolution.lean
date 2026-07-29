import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarieties

structure SpringerResolutionPackage where
  flagVariety : Type u
  cotangentBundle : Type v
  resolutionMap : Type w
  isomorphismOnSmoothLocus : Prop
  weylGroupActionOnFiber : Prop
  sheafCohomologyInterpretation : Prop
  perverseSheafConstruction : Prop

structure SpringerResolutionEvidence (S : SpringerResolutionPackage) where
  isomorphismOnSmoothLocusClosed : S.isomorphismOnSmoothLocus
  weylGroupActionOnFiberClosed : S.weylGroupActionOnFiber
  sheafCohomologyInterpretationClosed : S.sheafCohomologyInterpretation
  perverseSheafConstructionClosed : S.perverseSheafConstruction

def SpringerResolutionClosed (S : SpringerResolutionPackage) : Prop :=
  S.isomorphismOnSmoothLocus ∧ S.weylGroupActionOnFiber ∧
  S.sheafCohomologyInterpretation ∧ S.perverseSheafConstruction

theorem springer_resolution_closed_from_evidence (S : SpringerResolutionPackage) (E : SpringerResolutionEvidence S) :
    SpringerResolutionClosed S := by
  exact And.intro E.isomorphismOnSmoothLocusClosed
    (And.intro E.weylGroupActionOnFiberClosed
      (And.intro E.sheafCohomologyInterpretationClosed E.perverseSheafConstructionClosed))

end CoadjointOrbitsNilpotentVarieties
end HautevilleHouse
