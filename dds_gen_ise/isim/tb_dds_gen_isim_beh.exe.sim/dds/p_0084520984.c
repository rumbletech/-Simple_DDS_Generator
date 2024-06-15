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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
extern char *STD_STANDARD;
extern char *IEEE_P_3972351953;
static const char *ng2 = "Function clog2 ended without a return statement";

double ieee_p_3972351953_sub_1147618771_2984157535(char *, double );
double ieee_p_3972351953_sub_528838134_2984157535(char *, double );


int dds_p_0084520984_sub_583161852_1637400083(char *t1, int t2)
{
    char t3[128];
    char t4[8];
    char t8[8];
    int t0;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    unsigned char t12;
    double t13;
    double t14;
    int t15;
    unsigned char t16;
    double t17;
    double t18;

LAB0:    t5 = (t3 + 4U);
    t6 = ((STD_STANDARD) + 832);
    t7 = (t5 + 88U);
    *((char **)t7) = t6;
    t9 = (t5 + 56U);
    *((char **)t9) = t8;
    *((int *)t8) = 0;
    t10 = (t5 + 80U);
    *((unsigned int *)t10) = 4U;
    t11 = (t4 + 4U);
    *((int *)t11) = t2;
    t12 = (t2 == 0);
    if (t12 != 0)
        goto LAB2;

LAB4:    t13 = ieee_p_3972351953_sub_528838134_2984157535(IEEE_P_3972351953, ((double)(t2)));
    t14 = ieee_p_3972351953_sub_1147618771_2984157535(IEEE_P_3972351953, t13);
    t12 = (t14 >= 0);
    if (t12 == 1)
        goto LAB6;

LAB7:    t18 = (t14 - 0.50000000000000000);
    t15 = ((int)(t18));

LAB8:    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    *((int *)t6) = t15;
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t15 = *((int *)t7);
    t0 = t15;

LAB1:    return t0;
LAB2:    t0 = 0;
    goto LAB1;

LAB3:    xsi_error(ng2);
    t0 = 0;
    goto LAB1;

LAB5:    goto LAB3;

LAB6:    t16 = (t14 >= 2147483647);
    if (t16 == 1)
        goto LAB9;

LAB10:    t17 = (t14 + 0.50000000000000000);
    t15 = ((int)(t17));
    goto LAB8;

LAB9:    t15 = 2147483647;
    goto LAB8;

LAB11:    goto LAB3;

}


extern void dds_p_0084520984_init()
{
	static char *se[] = {(void *)dds_p_0084520984_sub_583161852_1637400083};
	xsi_register_didat("dds_p_0084520984", "isim/tb_dds_gen_isim_beh.exe.sim/dds/p_0084520984.didat");
	xsi_register_subprogram_executes(se);
}
