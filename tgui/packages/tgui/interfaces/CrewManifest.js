import { classes } from 'common/react';
import { useBackend } from "../backend";
import { Icon, Section, Table, Tooltip } from "../components";
import { Window } from "../layouts";



export const CrewManifest = (props, context) => {
  const { data: { manifest, positions } } = useBackend(context);

  return (
    <Window title="Crew Manifest" width={350} height={500}>
      <Window.Content scrollable>
        {Object.entries(manifest).map(([dept, crew]) => (
          <Section
            className={"CrewManifest--" + dept}
            key={dept}
            title={
              dept + (dept !== "Misc"
                ? ` (${positions[dept].open} positions open)` : "")
            }
          >
            <Table>
              {Object.entries(crew).map(([crewIndex, crewMember]) => (
                <Table.Row key={crewIndex}>
                  <Table.Cell
                    className={'CrewManifest__Cell'}
                    maxWidth="135px"
                    overflow="hidden"
                    width="50%">
                    {crewMember.name}
                  </Table.Cell>
                  <Table.Cell
                    className={classes([
                      "CrewManifest__Cell",
                      "CrewManifest__Icons",
                    ])}
                    collapsing
                    minWidth="40px"
                    width="40px">
                    {positions[dept].exceptions.includes(crewMember.rank) && (
                      <Icon className="CrewManifest__Icon" name="infinity">/
                      </Icon>
                    )}
                    {crewMember.rank === "Captain" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Command",
                        ])}
                        name="crown"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Head of Security" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Command",
                        ])}
                        name="user-shield"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Chief Engineer" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Command",
                        ])}
                        name="user-astronaut"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Chief Medical Officer" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Command",
                        ])}
                        name="user-md"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Head of Personnel" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Command",
                        ])}
                        name="dog"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Research Director" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Command",
                        ])}
                        name="user-graduate"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Quartermaster" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Head",
                        ])}
                        name="sack-dollar"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Assistant" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="toolbox"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Atmospheric Technician" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="fan"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Bartender" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="cocktail"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Botanist" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="seeding"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Cargo Technician" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="box"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Chaplain" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="cross"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Chemist" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="prescription-bottle"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Clown" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="face-green-tears"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Cook" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="utensils"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Curator" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="book"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Detective" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="user-secret"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Geneticist" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="dna"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Janitor" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="broom"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Lawyer" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="gavel"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Medical Doctor" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="staff-snake"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Mime" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="comment-slash"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Paramedic" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="truck-medical"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Prisoner" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="lock-keyhole"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Psychologist" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="brain"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Roboticist" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="battery-half"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Scientist" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="flask"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Security Officer" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="shield-halved"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Shaft Miner" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="digging"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Station Engineer" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="gears"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Virologist" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="virus"
                        >/
                      </Icon>
                    )}
                    {crewMember.rank === "Warden" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="handcuffs"
                      >/
                      </Icon>
                    )}
                    {crewMember.rank === "Artist" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="paintbrush"
                      >/
                      </Icon>
                    )}
                    {crewMember.rank === "Network Admin" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="satellite-dish"
                      >/
                      </Icon>
                    )}
                    {crewMember.rank === "Tourist" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="camera-retro"
                      >/
                      </Icon>
                    )}
                    {crewMember.rank === "Mining Medic" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="kit-medical"
                      >/
                      </Icon>
                    )}
                    {crewMember.rank === "Clerk" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="basket-shopping"
                      >/
                      </Icon>
                    )}
                    {crewMember.rank === "Brig Physician" && (
                      <Icon
                        className={classes([
                          "CrewManifest__Icon",
                          "CrewManifest__Icon--Crew",
                        ])}
                        name="suitcase-medical"
                      >/
                      </Icon>
                    )}
                  </Table.Cell>
                  <Table.Cell
                    className={classes([
                      "CrewManifest__Cell",
                      "CrewManifest__Cell--Rank",
                    ])}
                    collapsing
                    maxWidth="135px"
                    overflow="hidden"
                    width="50%">
                    {crewMember.rank}
                  </Table.Cell>
                </Table.Row>
              ))}
            </Table>
          </Section>
        ))}
      </Window.Content>
    </Window>
  );
};
