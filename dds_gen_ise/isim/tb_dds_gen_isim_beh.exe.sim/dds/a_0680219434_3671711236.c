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
static const char *ng0 = "C:/Main/-Simple_DDS_Generator/hdl/vhdl/dds_tb.vhd";
extern char *STD_STANDARD;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void dds_a_0680219434_3671711236_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;

LAB0:    t1 = (t0 + 5072U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(65, ng0);

LAB4:    if ((unsigned char)1 != 0)
        goto LAB5;

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 5704);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t2 = (t0 + 4880);
    xsi_process_wait(t2, t7);

LAB10:    *((char **)t1) = &&LAB11;

LAB1:    return;
LAB6:;
LAB8:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5704);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t2 = (t0 + 4880);
    xsi_process_wait(t2, t7);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    goto LAB4;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

}

void dds_a_0680219434_3671711236_sub_931611133_2481143666(char *t0, char *t1, char *t2, char *t3)
{
    char t5[40];
    char t6[16];
    char t11[16];
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    char *t12;
    int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    int64 t26;
    int64 t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;

LAB0:    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 1;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t9 = (0 - 1);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t8 = (t11 + 0U);
    t12 = (t8 + 0U);
    *((int *)t12) = 31;
    t12 = (t8 + 4U);
    *((int *)t12) = 0;
    t12 = (t8 + 8U);
    *((int *)t12) = -1;
    t13 = (0 - 31);
    t10 = (t13 * -1);
    t10 = (t10 + 1);
    t12 = (t8 + 12U);
    *((unsigned int *)t12) = t10;
    t12 = (t5 + 4U);
    t14 = (t2 != 0);
    if (t14 == 1)
        goto LAB3;

LAB2:    t15 = (t5 + 12U);
    *((char **)t15) = t6;
    t16 = (t5 + 20U);
    t17 = (t3 != 0);
    if (t17 == 1)
        goto LAB5;

LAB4:    t18 = (t5 + 28U);
    *((char **)t18) = t11;
    t19 = (t0 + 5896);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t0 + 9468U);
    t25 = (t24 + 12U);
    t10 = *((unsigned int *)t25);
    t10 = (t10 * 1U);
    memcpy(t23, t2, t10);
    xsi_driver_first_trans_fast(t19);
    t7 = (t0 + 5960);
    t8 = (t7 + 56U);
    t19 = *((char **)t8);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t0 + 9484U);
    t23 = (t22 + 12U);
    t10 = *((unsigned int *)t23);
    t10 = (t10 * 1U);
    memcpy(t21, t3, t10);
    xsi_driver_first_trans_fast(t7);
    t7 = (t0 + 5832);
    t8 = (t7 + 56U);
    t19 = *((char **)t8);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    t7 = (t0 + 6216);
    t8 = (t7 + 56U);
    t19 = *((char **)t8);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    t7 = (t0 + 3248U);
    t8 = *((char **)t7);
    t26 = *((int64 *)t8);
    t27 = (2 * t26);
    xsi_process_wait(t1, t27);

LAB9:    t7 = (t1 + 88U);
    t19 = *((char **)t7);
    t20 = (t19 + 2480U);
    *((unsigned int *)t20) = 1U;
    t21 = (t1 + 88U);
    t22 = *((char **)t21);
    t23 = (t22 + 0U);
    getcontext(t23);
    t24 = (t1 + 88U);
    t25 = *((char **)t24);
    t28 = (t25 + 2480U);
    t10 = *((unsigned int *)t28);
    if (t10 == 1)
        goto LAB10;

LAB11:    t29 = (t1 + 88U);
    t30 = *((char **)t29);
    t31 = (t30 + 2480U);
    *((unsigned int *)t31) = 3U;

LAB7:
LAB8:
LAB6:    t7 = (t0 + 9484U);
    t8 = (t7 + 12U);
    t10 = *((unsigned int *)t8);
    t10 = (t10 * 1U);
    t19 = xsi_get_transient_memory(t10);
    memset(t19, 0, t10);
    t20 = t19;
    memset(t20, (unsigned char)2, t10);
    t21 = (t0 + 5960);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t28 = (t0 + 9484U);
    t29 = (t28 + 12U);
    t32 = *((unsigned int *)t29);
    t32 = (t32 * 1U);
    memcpy(t25, t19, t32);
    xsi_driver_first_trans_fast(t21);
    t7 = (t0 + 6216);
    t8 = (t7 + 56U);
    t19 = *((char **)t8);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = (unsigned char)2;
    xsi_driver_first_trans_fast(t7);
    t7 = (t0 + 5832);
    t8 = (t7 + 56U);
    t19 = *((char **)t8);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = (unsigned char)2;
    xsi_driver_first_trans_fast(t7);

LAB1:    return;
LAB3:    *((char **)t12) = t2;
    goto LAB2;

LAB5:    *((char **)t16) = t3;
    goto LAB4;

LAB10:    xsi_saveStackAndSuspend(t1);
    goto LAB11;

}

void dds_a_0680219434_3671711236_sub_2209895879_2481143666(char *t0, char *t1, char *t2)
{
    char t4[24];
    char t5[16];
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int64 t19;
    int64 t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;

LAB0:    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 1;
    t7 = (t6 + 4U);
    *((int *)t7) = 0;
    t7 = (t6 + 8U);
    *((int *)t7) = -1;
    t8 = (0 - 1);
    t9 = (t8 * -1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t7 = (t4 + 4U);
    t10 = (t2 != 0);
    if (t10 == 1)
        goto LAB3;

LAB2:    t11 = (t4 + 12U);
    *((char **)t11) = t5;
    t12 = (t0 + 5896);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t0 + 9468U);
    t18 = (t17 + 12U);
    t9 = *((unsigned int *)t18);
    t9 = (t9 * 1U);
    memcpy(t16, t2, t9);
    xsi_driver_first_trans_fast(t12);
    t6 = (t0 + 5832);
    t12 = (t6 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast(t6);
    t6 = (t0 + 6216);
    t12 = (t6 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast(t6);
    t6 = (t0 + 3248U);
    t12 = *((char **)t6);
    t19 = *((int64 *)t12);
    t20 = (2 * t19);
    xsi_process_wait(t1, t20);

LAB7:    t6 = (t1 + 88U);
    t13 = *((char **)t6);
    t14 = (t13 + 2480U);
    *((unsigned int *)t14) = 1U;
    t15 = (t1 + 88U);
    t16 = *((char **)t15);
    t17 = (t16 + 0U);
    getcontext(t17);
    t18 = (t1 + 88U);
    t21 = *((char **)t18);
    t22 = (t21 + 2480U);
    t9 = *((unsigned int *)t22);
    if (t9 == 1)
        goto LAB8;

LAB9:    t23 = (t1 + 88U);
    t24 = *((char **)t23);
    t25 = (t24 + 2480U);
    *((unsigned int *)t25) = 3U;

LAB5:
LAB6:
LAB4:    t6 = (t0 + 9468U);
    t12 = (t6 + 12U);
    t9 = *((unsigned int *)t12);
    t9 = (t9 * 1U);
    t13 = xsi_get_transient_memory(t9);
    memset(t13, 0, t9);
    t14 = t13;
    memset(t14, (unsigned char)2, t9);
    t15 = (t0 + 5896);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t21 = *((char **)t18);
    t22 = (t0 + 9468U);
    t23 = (t22 + 12U);
    t26 = *((unsigned int *)t23);
    t26 = (t26 * 1U);
    memcpy(t21, t13, t26);
    xsi_driver_first_trans_fast(t15);
    t6 = (t0 + 6216);
    t12 = (t6 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast(t6);
    t6 = (t0 + 5832);
    t12 = (t6 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast(t6);

LAB1:    return;
LAB3:    *((char **)t7) = t2;
    goto LAB2;

LAB8:    xsi_saveStackAndSuspend(t1);
    goto LAB9;

}

void dds_a_0680219434_3671711236_sub_2586908880_2481143666(char *t0, char *t1, char *t2, char *t3)
{
    char t5[40];
    char t6[16];
    char t11[16];
    char t21[8];
    char t34[8];
    char t37[16];
    char t38[16];
    char t39[16];
    char t45[16];
    char t47[16];
    char t51[16];
    char t56[16];
    char t61[16];
    char t63[16];
    char t67[16];
    char t74[16];
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    char *t12;
    int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    int64 t23;
    int64 t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t35;
    unsigned int t36;
    char *t40;
    char *t41;
    unsigned int t42;
    char *t44;
    char *t46;
    char *t48;
    char *t49;
    int t50;
    int t52;
    char *t53;
    char *t54;
    char *t55;
    char *t57;
    char *t58;
    char *t60;
    char *t62;
    char *t64;
    char *t65;
    int t66;
    char *t68;
    char *t69;
    int t70;
    char *t71;
    char *t72;
    char *t73;
    char *t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    unsigned int t84;
    unsigned int t85;

LAB0:    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 1;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t9 = (0 - 1);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t8 = (t11 + 0U);
    t12 = (t8 + 0U);
    *((int *)t12) = 31;
    t12 = (t8 + 4U);
    *((int *)t12) = 0;
    t12 = (t8 + 8U);
    *((int *)t12) = -1;
    t13 = (0 - 31);
    t10 = (t13 * -1);
    t10 = (t10 + 1);
    t12 = (t8 + 12U);
    *((unsigned int *)t12) = t10;
    t12 = (t5 + 4U);
    t14 = (t2 != 0);
    if (t14 == 1)
        goto LAB3;

LAB2:    t15 = (t5 + 12U);
    *((char **)t15) = t6;
    t16 = (t5 + 20U);
    t17 = (t3 != 0);
    if (t17 == 1)
        goto LAB5;

LAB4:    t18 = (t5 + 28U);
    *((char **)t18) = t11;
    t19 = (t0 + 3728U);
    t20 = *((char **)t19);
    memcpy(t21, t20, 2U);
    t19 = (t11 + 12U);
    t10 = *((unsigned int *)t19);
    t10 = (t10 * 1U);
    t22 = (char *)alloca(t10);
    memcpy(t22, t3, t10);
    dds_a_0680219434_3671711236_sub_931611133_2481143666(t0, t1, t21, t22);
    t7 = (t0 + 3248U);
    t8 = *((char **)t7);
    t23 = *((int64 *)t8);
    t24 = (2 * t23);
    xsi_process_wait(t1, t24);

LAB9:    t7 = (t1 + 88U);
    t19 = *((char **)t7);
    t20 = (t19 + 2480U);
    *((unsigned int *)t20) = 1U;
    t25 = (t1 + 88U);
    t26 = *((char **)t25);
    t27 = (t26 + 0U);
    getcontext(t27);
    t28 = (t1 + 88U);
    t29 = *((char **)t28);
    t30 = (t29 + 2480U);
    t10 = *((unsigned int *)t30);
    if (t10 == 1)
        goto LAB10;

LAB11:    t31 = (t1 + 88U);
    t32 = *((char **)t31);
    t33 = (t32 + 2480U);
    *((unsigned int *)t33) = 3U;

LAB7:
LAB8:
LAB6:    t7 = (t0 + 3728U);
    t8 = *((char **)t7);
    memcpy(t34, t8, 2U);
    dds_a_0680219434_3671711236_sub_2209895879_2481143666(t0, t1, t34);
    t7 = (t0 + 1992U);
    t8 = *((char **)t7);
    t7 = (t0 + 9500U);
    t19 = (t7 + 12U);
    t10 = *((unsigned int *)t19);
    t10 = (t10 * 1U);
    t20 = (t11 + 12U);
    t35 = *((unsigned int *)t20);
    t35 = (t35 * 1U);
    t14 = 1;
    if (t10 == t35)
        goto LAB14;

LAB15:    t14 = 0;

LAB16:    if (t14 == 0)
        goto LAB12;

LAB13:    t7 = (t0 + 9799);
    t19 = ((STD_STANDARD) + 384);
    t9 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t6);
    t20 = xsi_int_to_mem(t9);
    t25 = xsi_string_variable_get_image(t37, t19, t20);
    t27 = ((STD_STANDARD) + 1008);
    t28 = (t39 + 0U);
    t29 = (t28 + 0U);
    *((int *)t29) = 1;
    t29 = (t28 + 4U);
    *((int *)t29) = 32;
    t29 = (t28 + 8U);
    *((int *)t29) = 1;
    t13 = (32 - 1);
    t10 = (t13 * 1);
    t10 = (t10 + 1);
    t29 = (t28 + 12U);
    *((unsigned int *)t29) = t10;
    t26 = xsi_base_array_concat(t26, t38, t27, (char)97, t7, t39, (char)97, t25, t37, (char)101);
    t29 = (t37 + 12U);
    t10 = *((unsigned int *)t29);
    t35 = (32U + t10);
    xsi_report(t26, t35, (unsigned char)0);

LAB1:    return;
LAB3:    *((char **)t12) = t2;
    goto LAB2;

LAB5:    *((char **)t16) = t3;
    goto LAB4;

LAB10:    xsi_saveStackAndSuspend(t1);
    goto LAB11;

LAB12:    t27 = (t0 + 9744);
    t29 = ((STD_STANDARD) + 384);
    t9 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t6);
    t30 = xsi_int_to_mem(t9);
    t31 = xsi_string_variable_get_image(t37, t29, t30);
    t33 = ((STD_STANDARD) + 1008);
    t40 = (t39 + 0U);
    t41 = (t40 + 0U);
    *((int *)t41) = 1;
    t41 = (t40 + 4U);
    *((int *)t41) = 29;
    t41 = (t40 + 8U);
    *((int *)t41) = 1;
    t13 = (29 - 1);
    t42 = (t13 * 1);
    t42 = (t42 + 1);
    t41 = (t40 + 12U);
    *((unsigned int *)t41) = t42;
    t32 = xsi_base_array_concat(t32, t38, t33, (char)97, t27, t39, (char)97, t31, t37, (char)101);
    t41 = (t0 + 9773);
    t46 = ((STD_STANDARD) + 1008);
    t48 = (t47 + 0U);
    t49 = (t48 + 0U);
    *((int *)t49) = 1;
    t49 = (t48 + 4U);
    *((int *)t49) = 17;
    t49 = (t48 + 8U);
    *((int *)t49) = 1;
    t50 = (17 - 1);
    t42 = (t50 * 1);
    t42 = (t42 + 1);
    t49 = (t48 + 12U);
    *((unsigned int *)t49) = t42;
    t44 = xsi_base_array_concat(t44, t45, t46, (char)97, t32, t38, (char)97, t41, t47, (char)101);
    t49 = ((STD_STANDARD) + 384);
    t52 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t11);
    t53 = xsi_int_to_mem(t52);
    t54 = xsi_string_variable_get_image(t51, t49, t53);
    t57 = ((STD_STANDARD) + 1008);
    t55 = xsi_base_array_concat(t55, t56, t57, (char)97, t44, t45, (char)97, t54, t51, (char)101);
    t58 = (t0 + 9790);
    t62 = ((STD_STANDARD) + 1008);
    t64 = (t63 + 0U);
    t65 = (t64 + 0U);
    *((int *)t65) = 1;
    t65 = (t64 + 4U);
    *((int *)t65) = 9;
    t65 = (t64 + 8U);
    *((int *)t65) = 1;
    t66 = (9 - 1);
    t42 = (t66 * 1);
    t42 = (t42 + 1);
    t65 = (t64 + 12U);
    *((unsigned int *)t65) = t42;
    t60 = xsi_base_array_concat(t60, t61, t62, (char)97, t55, t56, (char)97, t58, t63, (char)101);
    t65 = ((STD_STANDARD) + 384);
    t68 = (t0 + 1992U);
    t69 = *((char **)t68);
    t68 = (t0 + 9500U);
    t70 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t69, t68);
    t71 = xsi_int_to_mem(t70);
    t72 = xsi_string_variable_get_image(t67, t65, t71);
    t75 = ((STD_STANDARD) + 1008);
    t73 = xsi_base_array_concat(t73, t74, t75, (char)97, t60, t61, (char)97, t72, t67, (char)101);
    t76 = (t37 + 12U);
    t42 = *((unsigned int *)t76);
    t77 = (29U + t42);
    t78 = (t77 + 17U);
    t79 = (t51 + 12U);
    t80 = *((unsigned int *)t79);
    t81 = (t78 + t80);
    t82 = (t81 + 9U);
    t83 = (t67 + 12U);
    t84 = *((unsigned int *)t83);
    t85 = (t82 + t84);
    xsi_report(t73, t85, (unsigned char)2);
    goto LAB13;

LAB14:    t36 = 0;

LAB17:    if (t36 < t10)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t25 = (t8 + t36);
    t26 = (t3 + t36);
    if (*((unsigned char *)t25) != *((unsigned char *)t26))
        goto LAB15;

LAB19:    t36 = (t36 + 1);
    goto LAB17;

}

static void dds_a_0680219434_3671711236_p_1(char *t0)
{
    char t10[8];
    char t12[8];
    char t13[8];
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int64 t9;
    int64 t11;

LAB0:    t1 = (t0 + 5320U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 5768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 5832);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(117, ng0);
    t2 = xsi_get_transient_memory(2U);
    memset(t2, 0, 2U);
    t3 = t2;
    memset(t3, (unsigned char)2, 2U);
    t4 = (t0 + 5896);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(118, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t3 = t2;
    memset(t3, (unsigned char)2, 32U);
    t4 = (t0 + 5960);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 32U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 6024);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(120, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t3 = t2;
    memset(t3, (unsigned char)2, 8U);
    t4 = (t0 + 6088);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(121, ng0);
    t2 = xsi_get_transient_memory(16U);
    memset(t2, 0, 16U);
    t3 = t2;
    memset(t3, (unsigned char)2, 16U);
    t4 = (t0 + 6152);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 6216);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 6280);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(126, ng0);
    t9 = (100 * 1000LL);
    t2 = (t0 + 5128);
    xsi_process_wait(t2, t9);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 6280);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(128, ng0);
    t9 = (100 * 1000LL);
    t2 = (t0 + 5128);
    xsi_process_wait(t2, t9);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 5128);
    t3 = (t0 + 3728U);
    t4 = *((char **)t3);
    memcpy(t10, t4, 2U);
    t3 = (t0 + 9831);
    dds_a_0680219434_3671711236_sub_2586908880_2481143666(t0, t2, t10, t3);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t11 = (2 * t9);
    t2 = (t0 + 5128);
    xsi_process_wait(t2, t11);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(132, ng0);
    t2 = (t0 + 5128);
    t3 = (t0 + 3848U);
    t4 = *((char **)t3);
    memcpy(t12, t4, 2U);
    t3 = (t0 + 9863);
    dds_a_0680219434_3671711236_sub_2586908880_2481143666(t0, t2, t12, t3);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t11 = (2 * t9);
    t2 = (t0 + 5128);
    xsi_process_wait(t2, t11);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 5128);
    t3 = (t0 + 3968U);
    t4 = *((char **)t3);
    memcpy(t13, t4, 2U);
    t3 = (t0 + 9895);
    dds_a_0680219434_3671711236_sub_2586908880_2481143666(t0, t2, t13, t3);
    xsi_set_current_line(135, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t11 = (2 * t9);
    t2 = (t0 + 5128);
    xsi_process_wait(t2, t11);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 5128);
    t3 = (t0 + 4088U);
    t4 = *((char **)t3);
    memcpy(t14, t4, 2U);
    t3 = (t0 + 9927);
    dds_a_0680219434_3671711236_sub_2586908880_2481143666(t0, t2, t14, t3);
    xsi_set_current_line(140, ng0);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    goto LAB2;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

}


extern void dds_a_0680219434_3671711236_init()
{
	static char *pe[] = {(void *)dds_a_0680219434_3671711236_p_0,(void *)dds_a_0680219434_3671711236_p_1};
	static char *se[] = {(void *)dds_a_0680219434_3671711236_sub_931611133_2481143666,(void *)dds_a_0680219434_3671711236_sub_2209895879_2481143666,(void *)dds_a_0680219434_3671711236_sub_2586908880_2481143666};
	xsi_register_didat("dds_a_0680219434_3671711236", "isim/tb_dds_gen_isim_beh.exe.sim/dds/a_0680219434_3671711236.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
