import DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean.CelestialMechanicsAdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

def CelestialWitnessClosed (O : CelestialMechanicsAdmittedObject) : Prop :=
  O.integrabilityCondition

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CelestialWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
