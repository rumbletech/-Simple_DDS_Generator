/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *DDS_P_0084520984;
char *IEEE_P_1242562249;
char *IEEE_P_3972351953;
char *IEEE_P_2592010699;
char *STD_STANDARD;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3972351953_init();
    dds_p_0084520984_init();
    dds_a_1582004088_3640575771_init();
    dds_a_2586988551_3640575771_init();
    dds_a_1307000967_3640575771_init();
    dds_a_2838140600_3640575771_init();
    dds_a_1389219207_3640575771_init();
    dds_a_0561671565_3640575771_init();
    dds_a_0680219434_3671711236_init();


    xsi_register_tops("dds_a_0680219434_3671711236");

    DDS_P_0084520984 = xsi_get_engine_memory("dds_p_0084520984");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");

    return xsi_run_simulation(argc, argv);

}
