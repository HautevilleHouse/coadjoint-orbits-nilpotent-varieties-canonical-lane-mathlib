import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.CoadjointOrbitStructure

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure KirillovCharacterFormula (L : NilpotentLieAlgebra) where
  orbit : CoadjointOrbit L L.field
  characterFormula : L.field → ℂ
  unitaryRepresentation : Prop
  characterFormulaComputable : Prop
  irreducibleComponent : Prop
  formulaLinOrbit : Prop

structure KirillovCharacterFormulaEvidence {L : NilpotentLieAlgebra} (K : KirillovCharacterFormula L) where
  unitaryRepresentationClosed : K.unitaryRepresentation
  characterFormulaComputableClosed : K.characterFormulaComputable
  irreducibleComponentClosed : K.irreducibleComponent
  formulaLinOrbitClosed : K.formulaLinOrbit

def KirillovCharacterFormulaClosed {L : NilpotentLieAlgebra} (K : KirillovCharacterFormula L) : Prop :=
  K.unitaryRepresentation ∧ K.characterFormulaComputable ∧ K.irreducibleComponent ∧ K.formulaLinOrbit

theorem kirillov_character_formula_closed {L : NilpotentLieAlgebra} (K : KirillovCharacterFormula L) (E : KirillovCharacterFormulaEvidence K) : KirillovCharacterFormulaClosed K := by
  exact And.intro E.unitaryRepresentationClosed (And.intro E.characterFormulaComputableClosed (And.intro E.irreducibleComponentClosed E.formulaLinOrbitClosed))

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
