import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure HamiltonianPackage (E : EulerLagrangePackage) where
  conjugateMomentum : Type u
  hamiltonian : E.position -> conjugateMomentum -> E.time -> Type v
  canonicalEquations : Prop
  energyConservation : Prop

structure HamiltonianEvidence {E : EulerLagrangePackage} (H : HamiltonianPackage E) where
  canonicalEquationsClosed : H.canonicalEquations
  energyConservationClosed : H.energyConservation

def HamiltonianClosed {E : EulerLagrangePackage} (H : HamiltonianPackage E) : Prop :=
  H.canonicalEquations ∧ H.energyConservation

theorem hamiltonian_closed_from_evidence {E : EulerLagrangePackage} (H : HamiltonianPackage E) (Ev : HamiltonianEvidence H) : HamiltonianClosed H :=
  And.intro Ev.canonicalEquationsClosed Ev.energyConservationClosed

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse