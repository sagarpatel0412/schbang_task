PGDMP  '    (    	            }            interview_task    16.2    16.2 C    V           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            W           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            X           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Y           1262    16515    interview_task    DATABASE     p   CREATE DATABASE interview_task WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE interview_task;
                postgres    false            �            1259    16784    dim_age_group    TABLE     `   CREATE TABLE public.dim_age_group (
    age_id integer NOT NULL,
    age_range text NOT NULL
);
 !   DROP TABLE public.dim_age_group;
       public         heap    postgres    false            �            1259    16783    dim_age_group_age_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_age_group_age_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.dim_age_group_age_id_seq;
       public          postgres    false    220            Z           0    0    dim_age_group_age_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.dim_age_group_age_id_seq OWNED BY public.dim_age_group.age_id;
          public          postgres    false    219            �            1259    16770    dim_date    TABLE     w   CREATE TABLE public.dim_date (
    date_id integer NOT NULL,
    date_value timestamp(3) without time zone NOT NULL
);
    DROP TABLE public.dim_date;
       public         heap    postgres    false            �            1259    16769    dim_date_date_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_date_date_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.dim_date_date_id_seq;
       public          postgres    false    216            [           0    0    dim_date_date_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.dim_date_date_id_seq OWNED BY public.dim_date.date_id;
          public          postgres    false    215            �            1259    16812    dim_device_type    TABLE     q   CREATE TABLE public.dim_device_type (
    device_type_id integer NOT NULL,
    device_type_name text NOT NULL
);
 #   DROP TABLE public.dim_device_type;
       public         heap    postgres    false            �            1259    16811 "   dim_device_type_device_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_device_type_device_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.dim_device_type_device_type_id_seq;
       public          postgres    false    228            \           0    0 "   dim_device_type_device_type_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.dim_device_type_device_type_id_seq OWNED BY public.dim_device_type.device_type_id;
          public          postgres    false    227            �            1259    16791 
   dim_gender    TABLE     b   CREATE TABLE public.dim_gender (
    gender_id integer NOT NULL,
    gender_name text NOT NULL
);
    DROP TABLE public.dim_gender;
       public         heap    postgres    false            �            1259    16790    dim_gender_gender_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_gender_gender_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.dim_gender_gender_id_seq;
       public          postgres    false    222            ]           0    0    dim_gender_gender_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.dim_gender_gender_id_seq OWNED BY public.dim_gender.gender_id;
          public          postgres    false    221            �            1259    16805    dim_placement    TABLE     k   CREATE TABLE public.dim_placement (
    placement_id integer NOT NULL,
    placement_name text NOT NULL
);
 !   DROP TABLE public.dim_placement;
       public         heap    postgres    false            �            1259    16804    dim_placement_placement_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_placement_placement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.dim_placement_placement_id_seq;
       public          postgres    false    226            ^           0    0    dim_placement_placement_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.dim_placement_placement_id_seq OWNED BY public.dim_placement.placement_id;
          public          postgres    false    225            �            1259    16798    dim_platform    TABLE     h   CREATE TABLE public.dim_platform (
    platform_id integer NOT NULL,
    platform_name text NOT NULL
);
     DROP TABLE public.dim_platform;
       public         heap    postgres    false            �            1259    16797    dim_platform_platform_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_platform_platform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.dim_platform_platform_id_seq;
       public          postgres    false    224            _           0    0    dim_platform_platform_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.dim_platform_platform_id_seq OWNED BY public.dim_platform.platform_id;
          public          postgres    false    223            �            1259    16777 
   dim_region    TABLE     b   CREATE TABLE public.dim_region (
    region_id integer NOT NULL,
    region_name text NOT NULL
);
    DROP TABLE public.dim_region;
       public         heap    postgres    false            �            1259    16776    dim_region_region_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_region_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.dim_region_region_id_seq;
       public          postgres    false    218            `           0    0    dim_region_region_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.dim_region_region_id_seq OWNED BY public.dim_region.region_id;
          public          postgres    false    217            �            1259    16819    fact_ad_metrics_daily    TABLE     �  CREATE TABLE public.fact_ad_metrics_daily (
    fact_id integer NOT NULL,
    date_id integer NOT NULL,
    region_id integer,
    age_id integer,
    gender_id integer,
    platform_id integer NOT NULL,
    placement_id integer NOT NULL,
    device_type_id integer,
    impressions integer NOT NULL,
    clicks integer NOT NULL,
    cost double precision NOT NULL,
    conversions integer NOT NULL,
    custom_metrics jsonb NOT NULL
);
 )   DROP TABLE public.fact_ad_metrics_daily;
       public         heap    postgres    false            �            1259    16818 !   fact_ad_metrics_daily_fact_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fact_ad_metrics_daily_fact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.fact_ad_metrics_daily_fact_id_seq;
       public          postgres    false    230            a           0    0 !   fact_ad_metrics_daily_fact_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.fact_ad_metrics_daily_fact_id_seq OWNED BY public.fact_ad_metrics_daily.fact_id;
          public          postgres    false    229            �           2604    16787    dim_age_group age_id    DEFAULT     |   ALTER TABLE ONLY public.dim_age_group ALTER COLUMN age_id SET DEFAULT nextval('public.dim_age_group_age_id_seq'::regclass);
 C   ALTER TABLE public.dim_age_group ALTER COLUMN age_id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    16773    dim_date date_id    DEFAULT     t   ALTER TABLE ONLY public.dim_date ALTER COLUMN date_id SET DEFAULT nextval('public.dim_date_date_id_seq'::regclass);
 ?   ALTER TABLE public.dim_date ALTER COLUMN date_id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    16815    dim_device_type device_type_id    DEFAULT     �   ALTER TABLE ONLY public.dim_device_type ALTER COLUMN device_type_id SET DEFAULT nextval('public.dim_device_type_device_type_id_seq'::regclass);
 M   ALTER TABLE public.dim_device_type ALTER COLUMN device_type_id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    16794    dim_gender gender_id    DEFAULT     |   ALTER TABLE ONLY public.dim_gender ALTER COLUMN gender_id SET DEFAULT nextval('public.dim_gender_gender_id_seq'::regclass);
 C   ALTER TABLE public.dim_gender ALTER COLUMN gender_id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16808    dim_placement placement_id    DEFAULT     �   ALTER TABLE ONLY public.dim_placement ALTER COLUMN placement_id SET DEFAULT nextval('public.dim_placement_placement_id_seq'::regclass);
 I   ALTER TABLE public.dim_placement ALTER COLUMN placement_id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16801    dim_platform platform_id    DEFAULT     �   ALTER TABLE ONLY public.dim_platform ALTER COLUMN platform_id SET DEFAULT nextval('public.dim_platform_platform_id_seq'::regclass);
 G   ALTER TABLE public.dim_platform ALTER COLUMN platform_id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    16780    dim_region region_id    DEFAULT     |   ALTER TABLE ONLY public.dim_region ALTER COLUMN region_id SET DEFAULT nextval('public.dim_region_region_id_seq'::regclass);
 C   ALTER TABLE public.dim_region ALTER COLUMN region_id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16822    fact_ad_metrics_daily fact_id    DEFAULT     �   ALTER TABLE ONLY public.fact_ad_metrics_daily ALTER COLUMN fact_id SET DEFAULT nextval('public.fact_ad_metrics_daily_fact_id_seq'::regclass);
 L   ALTER TABLE public.fact_ad_metrics_daily ALTER COLUMN fact_id DROP DEFAULT;
       public          postgres    false    230    229    230            I          0    16784    dim_age_group 
   TABLE DATA           :   COPY public.dim_age_group (age_id, age_range) FROM stdin;
    public          postgres    false    220   S       E          0    16770    dim_date 
   TABLE DATA           7   COPY public.dim_date (date_id, date_value) FROM stdin;
    public          postgres    false    216   �S       Q          0    16812    dim_device_type 
   TABLE DATA           K   COPY public.dim_device_type (device_type_id, device_type_name) FROM stdin;
    public          postgres    false    228   �T       K          0    16791 
   dim_gender 
   TABLE DATA           <   COPY public.dim_gender (gender_id, gender_name) FROM stdin;
    public          postgres    false    222   :U       O          0    16805    dim_placement 
   TABLE DATA           E   COPY public.dim_placement (placement_id, placement_name) FROM stdin;
    public          postgres    false    226   �U       M          0    16798    dim_platform 
   TABLE DATA           B   COPY public.dim_platform (platform_id, platform_name) FROM stdin;
    public          postgres    false    224   �V       G          0    16777 
   dim_region 
   TABLE DATA           <   COPY public.dim_region (region_id, region_name) FROM stdin;
    public          postgres    false    218   <W       S          0    16819    fact_ad_metrics_daily 
   TABLE DATA           �   COPY public.fact_ad_metrics_daily (fact_id, date_id, region_id, age_id, gender_id, platform_id, placement_id, device_type_id, impressions, clicks, cost, conversions, custom_metrics) FROM stdin;
    public          postgres    false    230   �W       b           0    0    dim_age_group_age_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.dim_age_group_age_id_seq', 50, true);
          public          postgres    false    219            c           0    0    dim_date_date_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.dim_date_date_id_seq', 50, true);
          public          postgres    false    215            d           0    0 "   dim_device_type_device_type_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.dim_device_type_device_type_id_seq', 50, true);
          public          postgres    false    227            e           0    0    dim_gender_gender_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.dim_gender_gender_id_seq', 50, true);
          public          postgres    false    221            f           0    0    dim_placement_placement_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.dim_placement_placement_id_seq', 50, true);
          public          postgres    false    225            g           0    0    dim_platform_platform_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.dim_platform_platform_id_seq', 50, true);
          public          postgres    false    223            h           0    0    dim_region_region_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.dim_region_region_id_seq', 50, true);
          public          postgres    false    217            i           0    0 !   fact_ad_metrics_daily_fact_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.fact_ad_metrics_daily_fact_id_seq', 200, true);
          public          postgres    false    229            �           2606    16789     dim_age_group dim_age_group_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.dim_age_group
    ADD CONSTRAINT dim_age_group_pkey PRIMARY KEY (age_id);
 J   ALTER TABLE ONLY public.dim_age_group DROP CONSTRAINT dim_age_group_pkey;
       public            postgres    false    220            �           2606    16775    dim_date dim_date_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.dim_date
    ADD CONSTRAINT dim_date_pkey PRIMARY KEY (date_id);
 @   ALTER TABLE ONLY public.dim_date DROP CONSTRAINT dim_date_pkey;
       public            postgres    false    216            �           2606    16817 $   dim_device_type dim_device_type_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.dim_device_type
    ADD CONSTRAINT dim_device_type_pkey PRIMARY KEY (device_type_id);
 N   ALTER TABLE ONLY public.dim_device_type DROP CONSTRAINT dim_device_type_pkey;
       public            postgres    false    228            �           2606    16796    dim_gender dim_gender_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.dim_gender
    ADD CONSTRAINT dim_gender_pkey PRIMARY KEY (gender_id);
 D   ALTER TABLE ONLY public.dim_gender DROP CONSTRAINT dim_gender_pkey;
       public            postgres    false    222            �           2606    16810     dim_placement dim_placement_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.dim_placement
    ADD CONSTRAINT dim_placement_pkey PRIMARY KEY (placement_id);
 J   ALTER TABLE ONLY public.dim_placement DROP CONSTRAINT dim_placement_pkey;
       public            postgres    false    226            �           2606    16803    dim_platform dim_platform_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.dim_platform
    ADD CONSTRAINT dim_platform_pkey PRIMARY KEY (platform_id);
 H   ALTER TABLE ONLY public.dim_platform DROP CONSTRAINT dim_platform_pkey;
       public            postgres    false    224            �           2606    16782    dim_region dim_region_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.dim_region
    ADD CONSTRAINT dim_region_pkey PRIMARY KEY (region_id);
 D   ALTER TABLE ONLY public.dim_region DROP CONSTRAINT dim_region_pkey;
       public            postgres    false    218            �           2606    16826 0   fact_ad_metrics_daily fact_ad_metrics_daily_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.fact_ad_metrics_daily
    ADD CONSTRAINT fact_ad_metrics_daily_pkey PRIMARY KEY (fact_id);
 Z   ALTER TABLE ONLY public.fact_ad_metrics_daily DROP CONSTRAINT fact_ad_metrics_daily_pkey;
       public            postgres    false    230            �           2606    16889 7   fact_ad_metrics_daily fact_ad_metrics_daily_age_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_ad_metrics_daily
    ADD CONSTRAINT fact_ad_metrics_daily_age_id_fkey FOREIGN KEY (age_id) REFERENCES public.dim_age_group(age_id) ON UPDATE CASCADE ON DELETE SET NULL;
 a   ALTER TABLE ONLY public.fact_ad_metrics_daily DROP CONSTRAINT fact_ad_metrics_daily_age_id_fkey;
       public          postgres    false    220    230    3491            �           2606    16879 8   fact_ad_metrics_daily fact_ad_metrics_daily_date_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_ad_metrics_daily
    ADD CONSTRAINT fact_ad_metrics_daily_date_id_fkey FOREIGN KEY (date_id) REFERENCES public.dim_date(date_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 b   ALTER TABLE ONLY public.fact_ad_metrics_daily DROP CONSTRAINT fact_ad_metrics_daily_date_id_fkey;
       public          postgres    false    3487    230    216            �           2606    16909 ?   fact_ad_metrics_daily fact_ad_metrics_daily_device_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_ad_metrics_daily
    ADD CONSTRAINT fact_ad_metrics_daily_device_type_id_fkey FOREIGN KEY (device_type_id) REFERENCES public.dim_device_type(device_type_id) ON UPDATE CASCADE ON DELETE SET NULL;
 i   ALTER TABLE ONLY public.fact_ad_metrics_daily DROP CONSTRAINT fact_ad_metrics_daily_device_type_id_fkey;
       public          postgres    false    3499    228    230            �           2606    16894 :   fact_ad_metrics_daily fact_ad_metrics_daily_gender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_ad_metrics_daily
    ADD CONSTRAINT fact_ad_metrics_daily_gender_id_fkey FOREIGN KEY (gender_id) REFERENCES public.dim_gender(gender_id) ON UPDATE CASCADE ON DELETE SET NULL;
 d   ALTER TABLE ONLY public.fact_ad_metrics_daily DROP CONSTRAINT fact_ad_metrics_daily_gender_id_fkey;
       public          postgres    false    3493    222    230            �           2606    16904 =   fact_ad_metrics_daily fact_ad_metrics_daily_placement_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_ad_metrics_daily
    ADD CONSTRAINT fact_ad_metrics_daily_placement_id_fkey FOREIGN KEY (placement_id) REFERENCES public.dim_placement(placement_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 g   ALTER TABLE ONLY public.fact_ad_metrics_daily DROP CONSTRAINT fact_ad_metrics_daily_placement_id_fkey;
       public          postgres    false    230    226    3497            �           2606    16899 <   fact_ad_metrics_daily fact_ad_metrics_daily_platform_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_ad_metrics_daily
    ADD CONSTRAINT fact_ad_metrics_daily_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.dim_platform(platform_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 f   ALTER TABLE ONLY public.fact_ad_metrics_daily DROP CONSTRAINT fact_ad_metrics_daily_platform_id_fkey;
       public          postgres    false    224    3495    230            �           2606    16884 :   fact_ad_metrics_daily fact_ad_metrics_daily_region_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_ad_metrics_daily
    ADD CONSTRAINT fact_ad_metrics_daily_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.dim_region(region_id) ON UPDATE CASCADE ON DELETE SET NULL;
 d   ALTER TABLE ONLY public.fact_ad_metrics_daily DROP CONSTRAINT fact_ad_metrics_daily_region_id_fkey;
       public          postgres    false    3489    230    218            I   �   x�=��	CAC����0!��|zI�u�o9 i�ӑ+{��V���˽�ѫ��S�N�>��Tz�3�t�� 5� �)P�樉�����9j�&j�&j�Z�uMG-��P�Pգը�E��F5�Q�ڣ~����D	      E   �   x�U��MQ�5	4���!�	�T!�U�|�n޺�:k����ϟw45���}����;��ި7�E�S����Iս)�Nȥܯ��2���0#a F�`��!�2����QF�FYR6ʒ�Q�����l�%e�,)eI�(��A�o|ʜ��d�g^���%?Y�����;Y�y���'Y�-����C^�������(=�E�!/JyQzȋ�C�Pz�_�q|fNˢ      Q   �   x�Mб
�@�:�0���/���v�6R������Y�Ɔ۱�����}���)>ܟ뾝Ea��氎-a6��Va����	��;�P<�Ղk�=Yp�����?�`�`���/g��1g���s�sM\S^��5�5qM\S^�ĵ���R�w}��      K   �   x�E�=
�1����a$���]�N���E�B���df��<���r�T��z�~\?��N�{�޸��퓻�f+"'!�����eYT�T
Ƀ ���E�4㯙�����£�+���GW��T���� k j@5�5j�N)�/��w2      O   �   x�M�;1E�z��/���ii@�b*����"��i��n�9���}_���m�y���,*A5�-�A#H�2�@�Ts�P�k�v����54gW��Z\+�Q����j���&��&�'�(�S�U�W�W�+���
|�_�_�z�D�	��      M   �   x�M�;
�` ����H������&j�L ��]v�i>F�e���{>b�<<�Ǻ������}�$�uZ��uY�F�d�m�m�V��U�Z-su���ξA߲���GoU��tj)5P�V�Rk������uz^O����:��ހ7�xg�z�Ho�����O"�����      G   �   x�]ѹ
Q����)|1˸�heiP�q+ƙ����ͱ�|p�e7޼���l���#-o��w;�NV�޿|�SSN����_FZN���!ܤ��d�R�Q��2�\a���l�Rm	[Жl�Rm	[Жl+�Zm��F[��`k�5lE[�m`[�-l��t�l���mh[���s"� G>��      S      x�}�M�dIn��/O1����?:�N0-H�V��Pw�}�/����UY��t:i4�j�j��ɿ�W�r�J�]9�q���݊�������������J���?�������^�~ʥU�U����r�j�J��m^y�|�:���?�u�����b�,)�͸��o]U_�)�Ζu�N�����vP^������YF�Kߘ�y�k�����W븇�z;��`O�~�Uץoj��ѵ&��Y���Sf�o����A��~��x9�t�� ��+֢ۭv�/�x�r�=#�^�Bܨ'N�isȂ-'�y�Mm��K�^+��Y����e���uҚi^{��������������e\�lk~*}quY)GO�����3��ǯ��H�~y���k�2��˸��f�r���:I��k�\��CY�v���ܾo�Y[
^
1�u9�@�.��W��Ay%lm��k����pI�6��.BS8개F����*7���nRW�\�q!}��#&1��}ʼ���ך܄��o98<+"�(
~^� �{����"�^�Me!Y�=���LZ|���MP �*A88�wE7\�]~�a���ϓ���� Jٻ���W�c�����
a��b�QY8,#M&�Okl{?�b��=z2]��M����=�Zwk=�5��ŧ�v͇�5ea��^�
���%��+�9���W�U�2u/���'�ǻA
��n
'Bz� 
$�ˉfجi��Jz8��|?�E�W��78u�M�ϩ먘,����:��3�i��eђ��9�1�S�
����c�
�eHq�k|��ǟ�Z����ܝW�ڊW+:h-�2y�mX�C��I�ZUeJx�>�R&|M4O<�Ro�iU��=��O
0PR8jp������A0\0u���(J5�[O����A�#���N.7]�B���W�I�J߼��*�s�($�M'��I$J�)���k�Ld,����Ar���c�[`�gH�K��&��Gȵt��(�T]U8]����;�}���!ڈ]�dp�Ԣ�}����~�V�'I≻s40�6A�
2���-�H�(2b�g�-�n�Y�N���K=���e����$*�O�e�Ǖ;�C��n*���B�5�	�qLW㚍�4���N0�\Ŗ�d`�!4��Ht�?����	�*�׼�'+`n�y�@(�u^u�R��r_\?�pe�{*�7��&�#�ɓI)�[wJ���e����f�+f���H+�I}):��p��:Оc�\=�3�XY�n���V+:�"s���ఈr�>�z��<�H��0M�Yj�����2Q���@�<����8)��V�X��W��y�d��I����JE�Z�L���^}���o�^����z��r�ISA)��9���<�
�́��Zא(�Gp�FM+�$���m�LW�x��[$���d.�����M-��5�7+��-���V��%����!p ����V�@�o�R���N���K�(|dl!ک�M ��!�M����4�*�{j�/H�<�r�:Uϵg�i� (�C���u���Mi&N�(�i3 tB�����tvo$�ǳ���D��d���ލ� �,��t��U'�����e�0�l�^V|����1�l���J K��$]�2�������-E&�ݦ�-�a'��M^��͞������&Wp�n>��D�o�i�M���2�geR��	/��/����%/���ᔢx�v9���-�u�w�YH���PH�{Ϊ�~Z3\�-���n7�[��v���]��d�&ٔ?���"M�e+�=���5�X'9������7�R,�~��S�(6_<�9�涫��#��7������P��S���O��HÝ��{yx�0!Ĝ��G��A����.�dp#wg.���P)!b�A�0e�.j��t�n@w������'.ei��2�NH/���4I�^�S�ʱu��P�9��]d/E��y+�*��'3���=���w٤�
ZZ��B�R�'��ǫvw;B U��� 7}�B�J�7-� .l3���A�2�`T�+#��C����Y��ii�7���J����l���G��ʐ�Kq0}L1�����a�B�U
7��w���h �w���V
-�A�Q�~
�ݤcs)��q�|��������������t���[O�,?�i�Eѡ�l�q��g^�Of'�������t�F(�o��؂����3Yx=�U�Z�D­.��*�',�z�Fe�\�	0ԛ���t��
�4�&��f�{<m�g��'t/�<
C��� �kY��(�m�%V�z�0in8J����{��"��`��E���.rA�@���w�	����\�0�4\T�<K]eZ|w>��D�h��~���\n�#X����Tg������z��	�ި����x3����Z��J"&{�E�Uo�!Q��A���B�6u�0��K쮊>8��;3Y&�(׶�>���c?%��ln�p�����bz-��<�P���7�{�sc�!�+8N����y�1 �i�R��G�_	�6b�S8n׶�15��MW[���H�{���<������ß���d�Gg$T[$�m9�=2��ޏ���|�L oyZ]�=�B�-���[�����Ԧ~]��خ�A�+Q�x�>��&�h�m�|XE�Żg�D]� �y�18�P�A��L�����-�ʙ	Y\�c�'m��;���F`
Ҷ5`�߅�YV����h	��Є����Q1��Ȃ�b~�*л�5=ޓM�����Q8��`�x��t�W�@Hi��#� z�����$@��r��^���1�am�]�V1�H�O��˺%�k���,�+�� Ì!�����l�xY H%є#�L�S����e�_���9�R�Y&������`�O˺ے��N<!��a�3�T)`bZ�(z��Y��]���˺t���/\�Fa?�hs4�05^���9V-������{�TZ�qDT54�S�Y�l��kR�D�����M/#G�8|���4�c%n'�T±8���X1��q�rG�x]�S�2u�*}/��|�<�'8�d�B�G)(�{B����8�VN~*1�j�GѫG��G��h�����,
�v�ġ�G���=�x�j�G�[�at���;{��~X�z'�s_�Z�sǓ�E�0�9���G�Q�ni�\=�~���3F��,:�bD�i�c���ɜ<+<$��g(V3dl0�Te�Z��K;�oRE�a�d��Rx�%����+Ɩ,ۨ�UAc��^�:f}^4�MQ:zfG�2g�^_a�^�x\��_���0���\��?El�:���&��bW��ԫ\ʃ+>�מ�|���k�$��8�ba.���5磭@6:$lЃԾ�dQ$�/Қ9��b��ٷ̢��.ΩQ,�:h�M��O��i��BP���N���=�K��ϴ�[�i��*�2���˼��ؗ�&r��@Wo�Cƙ�B>6�.�E����q�^���Χy�f0 ��������LD��[s�^f�A0��A���l�|,�RL	��P����K:2���OG�����2���!R���v8(�T'
��V�tF�-�oe曫K�L�9i5����]J�
o�(��Y�"��@9vgwӥR{T��6ph���Go��1�{$�fڠ*e��l-;�(�}5g�L4K=
��zj(���]qn�,4��B`�� ���I��P=����^s���s���(�Ս�v�;��feO�V����E�o�o���J��PH7YS�Ӫ&(8f�Օ`��0㵔d�da�x�3z�b���q �RZ>��39w�@M/]9[�G�j��6Ӱ1���<*�BJ�?،��;��v�x��,Zeo� +�H=a��SW�S�A�z�\��ԇ�#F?��7w~�x�U�3�i�i�����2Jm��qi�����׎�]�W�kӐ�Z�&W0+�^��A�5o~�3�n�V�����F��h	��&�r�ݩ�ӫI[@='�~J����y9���c�{v�0a����X*���KN.{�����9�v��L-�G�^��*R;�� D  z�7�t���W���}Q�����.wZ��=����n
M�.zB�(q�����tCG�(~?P�(�6���)ꣅ�C/vϢ��
��#%ב��.��8���do����Pw�s��L�(Mq@U ���Yq���E=#��=nL�7�2.� �|}o����Ne����֧Wy��TP�_h���"Rrz�x3�p/��MA腒����G��Z.,n����s��Z�#[ [m�f|�ܹ�Y�����6�@��t��I�BN�T�������eED|1]8��(��~�k��G~ZG����c����i��m�x�l�{��l�[LJ�ry¹�U� v��,�c_�p�3����%��n��a��Q�q�p�l��|���/�ӛ��6�Yq�9f��:���F�]Z�ȣ(l�~�܈5�����S�W|�]�6�<)yzV���Ɗe��:�~Vqп�x� ��e�zܿ���Ԧ�g��Ѿ���u����l4��`V�#���Y��ש�Se�=a��E����}iS37��^�Qpd�ױT��qU��`* ��1�	�*�����^i�f���¨;���Y��
􌇻7��Y�S^�*K|,B���t����Ă1�ZoS�j�=��l��齐�~�f�����V[��+.�:���8:u����$VC�ꆞ!S���|H��f�4�(�-�aX���R��*T��s~�����z��9�C�R�[��:l\=&q�z!���M���q�[h���������������BM�*���`q��������J���]g�Y�m�>���Zn�CP�⶧��e��|Ɔ��O��[<��b|���h_�`�χ��&���"��~hi"�7Z�������/z��-:R{�=>��
�x=#*����jiy�W���ʱ���KO<��<%�3v6[�y#�����e?:���9���#dZ��S鷷�C���b��C�|>��(�֟��f�rz>�t�mw��5,���Qy��s1�,d��� ��K�|&�·�A֫k7��n�{�i�c�5�e��a�g���eR1'�uv��`��@i��!4�xut>>�D��c@���#1���hP��J3SS��t|��r�¬�����D����[��W���Ρ2��*�������]���$/=��N�VY��8��c�/q��i��A�*���x��V���3����u��r���3�*�|�� <{���7��c,��Y���v��>Eƽ�Ru���3(���Ɠ�.7���6	���/�|k����λ+�z��82�����Cԏ(��}1,U,>
?������������*     