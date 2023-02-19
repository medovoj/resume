PGDMP         .            
    z            resume    14.5    14.5 ?    c           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            d           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            e           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            f           1262    82424    resume    DATABASE     Q   CREATE DATABASE resume WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE resume;
                postgres    false                        2615    82425    resume    SCHEMA        CREATE SCHEMA resume;
    DROP SCHEMA resume;
                postgres    false            �            1259    82451    certificate    TABLE     �   CREATE TABLE resume.certificate (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(50) NOT NULL,
    large_url character varying(255) NOT NULL,
    small_url character varying(255) NOT NULL
);
    DROP TABLE resume.certificate;
       resume         heap    postgres    false    5            �            1259    82545    certificate_seq    SEQUENCE     x   CREATE SEQUENCE resume.certificate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE resume.certificate_seq;
       resume          postgres    false    5            �            1259    82463    course    TABLE     �   CREATE TABLE resume.course (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(60) NOT NULL,
    school character varying(60) NOT NULL,
    finish_date date
);
    DROP TABLE resume.course;
       resume         heap    postgres    false    5            �            1259    82546 
   course_seq    SEQUENCE     s   CREATE SEQUENCE resume.course_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE resume.course_seq;
       resume          postgres    false    5            �            1259    82473 	   education    TABLE       CREATE TABLE resume.education (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    summary character varying(100) NOT NULL,
    begin_year integer NOT NULL,
    finish_year integer,
    university text NOT NULL,
    faculty character varying NOT NULL
);
    DROP TABLE resume.education;
       resume         heap    postgres    false    5            �            1259    82547    education_seq    SEQUENCE     v   CREATE SEQUENCE resume.education_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE resume.education_seq;
       resume          postgres    false    5            �            1259    82485    hobby    TABLE        CREATE TABLE resume.hobby (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE resume.hobby;
       resume         heap    postgres    false    5            �            1259    82548 	   hobby_seq    SEQUENCE     r   CREATE SEQUENCE resume.hobby_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE resume.hobby_seq;
       resume          postgres    false    5            �            1259    82495    language    TABLE     �   CREATE TABLE resume.language (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(30) NOT NULL,
    level character varying(20) NOT NULL,
    type character varying(30) NOT NULL
);
    DROP TABLE resume.language;
       resume         heap    postgres    false    5            �            1259    82549    language_seq    SEQUENCE     u   CREATE SEQUENCE resume.language_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE resume.language_seq;
       resume          postgres    false    5            �            1259    82505    practice    TABLE     �  CREATE TABLE resume.practice (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    "position" character varying(100) NOT NULL,
    company character varying(100) NOT NULL,
    begin_date date NOT NULL,
    end_date date,
    responsobilities text NOT NULL,
    demo character varying(255) DEFAULT NULL::character varying,
    src character varying(255) DEFAULT NULL::character varying
);
    DROP TABLE resume.practice;
       resume         heap    postgres    false    5            �            1259    82550    practice_seq    SEQUENCE     u   CREATE SEQUENCE resume.practice_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE resume.practice_seq;
       resume          postgres    false    5            �            1259    82426    profile    TABLE     {  CREATE TABLE resume.profile (
    id bigint NOT NULL,
    uid character varying(100) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birthday date,
    phone character varying(20) DEFAULT NULL::character varying,
    email character varying(100) DEFAULT NULL::character varying,
    country character varying(60) DEFAULT NULL::character varying,
    city character varying(100) DEFAULT NULL::character varying,
    objective text,
    summary text,
    large_photo character varying(255) DEFAULT NULL::character varying,
    small_photo character varying(255) DEFAULT NULL::character varying,
    info text,
    password character varying(255) NOT NULL,
    completed boolean NOT NULL,
    skype character varying(60) DEFAULT NULL::character varying,
    facebook character varying(255) DEFAULT NULL::character varying,
    linkedin character varying(255) DEFAULT NULL::character varying,
    github character varying(255) DEFAULT NULL::character varying,
    stackoverflow character varying(255) DEFAULT NULL::character varying,
    created time with time zone DEFAULT now() NOT NULL
);
    DROP TABLE resume.profile;
       resume         heap    postgres    false    5            �            1259    82531    profile_restore    TABLE     k   CREATE TABLE resume.profile_restore (
    id bigint NOT NULL,
    token character varying(255) NOT NULL
);
 #   DROP TABLE resume.profile_restore;
       resume         heap    postgres    false    5            �            1259    82551    profile_seq    SEQUENCE     t   CREATE SEQUENCE resume.profile_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE resume.profile_seq;
       resume          postgres    false    5            �            1259    82519    skill    TABLE     �   CREATE TABLE resume.skill (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    category character varying NOT NULL,
    value character varying NOT NULL
);
    DROP TABLE resume.skill;
       resume         heap    postgres    false    5            �            1259    82538    skill_category    TABLE     l   CREATE TABLE resume.skill_category (
    id bigint NOT NULL,
    category character varying(50) NOT NULL
);
 "   DROP TABLE resume.skill_category;
       resume         heap    postgres    false    5            �            1259    82552 	   skill_seq    SEQUENCE     r   CREATE SEQUENCE resume.skill_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE resume.skill_seq;
       resume          postgres    false    5            P          0    82451    certificate 
   TABLE DATA           Q   COPY resume.certificate (id, id_profile, name, large_url, small_url) FROM stdin;
    resume          postgres    false    210   EJ       Q          0    82463    course 
   TABLE DATA           K   COPY resume.course (id, id_profile, name, school, finish_date) FROM stdin;
    resume          postgres    false    211   aM       R          0    82473 	   education 
   TABLE DATA           j   COPY resume.education (id, id_profile, summary, begin_year, finish_year, university, faculty) FROM stdin;
    resume          postgres    false    212   N       S          0    82485    hobby 
   TABLE DATA           5   COPY resume.hobby (id, id_profile, name) FROM stdin;
    resume          postgres    false    213   NO       T          0    82495    language 
   TABLE DATA           E   COPY resume.language (id, id_profile, name, level, type) FROM stdin;
    resume          postgres    false    214   jR       U          0    82505    practice 
   TABLE DATA           z   COPY resume.practice (id, id_profile, "position", company, begin_date, end_date, responsobilities, demo, src) FROM stdin;
    resume          postgres    false    215   cT       O          0    82426    profile 
   TABLE DATA           �   COPY resume.profile (id, uid, first_name, last_name, birthday, phone, email, country, city, objective, summary, large_photo, small_photo, info, password, completed, skype, facebook, linkedin, github, stackoverflow, created) FROM stdin;
    resume          postgres    false    209   1W       W          0    82531    profile_restore 
   TABLE DATA           4   COPY resume.profile_restore (id, token) FROM stdin;
    resume          postgres    false    217   �c       V          0    82519    skill 
   TABLE DATA           @   COPY resume.skill (id, id_profile, category, value) FROM stdin;
    resume          postgres    false    216   d       X          0    82538    skill_category 
   TABLE DATA           6   COPY resume.skill_category (id, category) FROM stdin;
    resume          postgres    false    218   i       g           0    0    certificate_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('resume.certificate_seq', 23, true);
          resume          postgres    false    219            h           0    0 
   course_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('resume.course_seq', 14, true);
          resume          postgres    false    220            i           0    0    education_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('resume.education_seq', 24, true);
          resume          postgres    false    221            j           0    0 	   hobby_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('resume.hobby_seq', 120, true);
          resume          postgres    false    222            k           0    0    language_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('resume.language_seq', 68, true);
          resume          postgres    false    223            l           0    0    practice_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('resume.practice_seq', 42, true);
          resume          postgres    false    224            m           0    0    profile_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('resume.profile_seq', 24, true);
          resume          postgres    false    225            n           0    0 	   skill_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('resume.skill_seq', 183, true);
          resume          postgres    false    226            �           2606    82544    skill_category category 
   CONSTRAINT     V   ALTER TABLE ONLY resume.skill_category
    ADD CONSTRAINT category UNIQUE (category);
 A   ALTER TABLE ONLY resume.skill_category DROP CONSTRAINT category;
       resume            postgres    false    218            �           2606    82576    certificate certificate_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY resume.certificate
    ADD CONSTRAINT certificate_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY resume.certificate DROP CONSTRAINT certificate_pkey;
       resume            postgres    false    210            �           2606    82578    course course_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY resume.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY resume.course DROP CONSTRAINT course_pkey;
       resume            postgres    false    211            �           2606    82580    education education_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY resume.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY resume.education DROP CONSTRAINT education_pkey;
       resume            postgres    false    212            �           2606    82450    profile email 
   CONSTRAINT     I   ALTER TABLE ONLY resume.profile
    ADD CONSTRAINT email UNIQUE (email);
 7   ALTER TABLE ONLY resume.profile DROP CONSTRAINT email;
       resume            postgres    false    209            �           2606    82582    language language_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY resume.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY resume.language DROP CONSTRAINT language_pkey;
       resume            postgres    false    214            �           2606    82448    profile phone 
   CONSTRAINT     I   ALTER TABLE ONLY resume.profile
    ADD CONSTRAINT phone UNIQUE (phone);
 7   ALTER TABLE ONLY resume.profile DROP CONSTRAINT phone;
       resume            postgres    false    209            �           2606    82570 
   hobby pkey 
   CONSTRAINT     H   ALTER TABLE ONLY resume.hobby
    ADD CONSTRAINT pkey PRIMARY KEY (id);
 4   ALTER TABLE ONLY resume.hobby DROP CONSTRAINT pkey;
       resume            postgres    false    213            �           2606    82572    practice practice_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY resume.practice
    ADD CONSTRAINT practice_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY resume.practice DROP CONSTRAINT practice_pkey;
       resume            postgres    false    215            �           2606    82444    profile profile_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY resume.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY resume.profile DROP CONSTRAINT profile_pkey;
       resume            postgres    false    209            �           2606    82535 $   profile_restore profile_restore_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY resume.profile_restore
    ADD CONSTRAINT profile_restore_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY resume.profile_restore DROP CONSTRAINT profile_restore_pkey;
       resume            postgres    false    217            �           2606    82542 "   skill_category skill_category_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY resume.skill_category
    ADD CONSTRAINT skill_category_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY resume.skill_category DROP CONSTRAINT skill_category_pkey;
       resume            postgres    false    218            �           2606    82574    skill skill_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY resume.skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY resume.skill DROP CONSTRAINT skill_pkey;
       resume            postgres    false    216            �           2606    82537    profile_restore token 
   CONSTRAINT     Q   ALTER TABLE ONLY resume.profile_restore
    ADD CONSTRAINT token UNIQUE (token);
 ?   ALTER TABLE ONLY resume.profile_restore DROP CONSTRAINT token;
       resume            postgres    false    217            �           2606    82446    profile uid 
   CONSTRAINT     E   ALTER TABLE ONLY resume.profile
    ADD CONSTRAINT uid UNIQUE (uid);
 5   ALTER TABLE ONLY resume.profile DROP CONSTRAINT uid;
       resume            postgres    false    209            �           2606    82563 #   education education_id_profile_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY resume.education
    ADD CONSTRAINT education_id_profile_fkey FOREIGN KEY (id_profile) REFERENCES resume.profile(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 M   ALTER TABLE ONLY resume.education DROP CONSTRAINT education_id_profile_fkey;
       resume          postgres    false    212    3492    209            �           2606    82490    hobby fk    FK CONSTRAINT     �   ALTER TABLE ONLY resume.hobby
    ADD CONSTRAINT fk FOREIGN KEY (id_profile) REFERENCES resume.profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 2   ALTER TABLE ONLY resume.hobby DROP CONSTRAINT fk;
       resume          postgres    false    213    209    3492            �           2606    82500    language fk    FK CONSTRAINT     �   ALTER TABLE ONLY resume.language
    ADD CONSTRAINT fk FOREIGN KEY (id_profile) REFERENCES resume.profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 5   ALTER TABLE ONLY resume.language DROP CONSTRAINT fk;
       resume          postgres    false    3492    209    214            �           2606    82514    practice fk    FK CONSTRAINT     �   ALTER TABLE ONLY resume.practice
    ADD CONSTRAINT fk FOREIGN KEY (id_profile) REFERENCES resume.profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 5   ALTER TABLE ONLY resume.practice DROP CONSTRAINT fk;
       resume          postgres    false    209    3492    215            �           2606    82526    skill fk    FK CONSTRAINT     �   ALTER TABLE ONLY resume.skill
    ADD CONSTRAINT fk FOREIGN KEY (id_profile) REFERENCES resume.profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 2   ALTER TABLE ONLY resume.skill DROP CONSTRAINT fk;
       resume          postgres    false    3492    209    216            �           2606    82553    certificate fk    FK CONSTRAINT     �   ALTER TABLE ONLY resume.certificate
    ADD CONSTRAINT fk FOREIGN KEY (id_profile) REFERENCES resume.profile(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY resume.certificate DROP CONSTRAINT fk;
       resume          postgres    false    210    209    3492            �           2606    82558 	   course fk    FK CONSTRAINT     �   ALTER TABLE ONLY resume.course
    ADD CONSTRAINT fk FOREIGN KEY (id_profile) REFERENCES resume.profile(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 3   ALTER TABLE ONLY resume.course DROP CONSTRAINT fk;
       resume          postgres    false    211    3492    209            P     x���K�;��uV�(ǒe��� Y�ù�I��U���7M
~�Y�_�#�������������o���9>�����/k���:�˘`MZie͑ײzK���7
�/?|�����2�L��g-@i�DS�(�?���۹�4�{c0�
l��K�``�,�h-�%~@�Q^�U�c4JL�ϿJ%�Reig�%~`����U�-5�eU��z�ֵ��t�����U��B�L�Ro�X�c3���ytq�i:n�XX����۠�0|P<7ը�F���]���-���B��1�8�c��|��,y�p{^��K���5���&��Y�����MF�\��n�X����M�i,)�	[�����]���>��Î��l���rn���HN�WK��NQc�tK|a�d������� V�sKLRL ��f5�Vn�/�|���'yuG�� cq�}N���"��i�_X|D�v�jw��,���ص9��Q�b��d��V9p�~�Ѱd���ȱum�u��i���Pw�V=�U�h+�GkY��Z���REɹZ~^��%�����8Ff�w�`�ְ�������e�_`��W�~R�8���GLz5�)�R���%����W�~v��	�z�jX�M¹��~Z��s��_j���8���s��ضaC}��%:GD�\�����q->#��Ԑ#r�ݒ�X6��/,:h߽��:�yT�h�/.P�
N�i�D����_X��}��ɃH*���ޤ��@�c_�S�Z
�?��~~{{�,�&/      Q   �   x���;�0�z|�\ Ȼv�)4�i��-H|r~\l$�5����Θ@����u+������y�*n�Y���GFg�u�;x��1�OH
��&��f�Aռ��趟�AQ��ɂ�z?+����Ho_h�g!��%�܃�Ν��`��)J��      R   3  x�Ŗ�j�0���S�ư����i�K�[/��h�'-���7��`rH�Y��Y׉��$����~h�D��:�d7�8���FvD��Fc�|O��[���7��Jv
�����7����u{�!�_���W��,��ބ�`4��RB�w���WPI��>���ꌙo�ɸ�Zh3ֽ�NBow�����g�����=���t�.U�P�;}l�h~	(2G?�_�����yPd�T�P�T�oE�K�� E�Kt�)Pb?����v�<f�O��M�n/�{"�%��	qH���#	��������gQ��      S     x�e��n�0���S�	
�"yL��E��^hG��f 9	��������~q��#�$��������o��m�5�;���q�֛k}�4=��Ǐx��mlәWL���]{�`}��ߤ���/��{h�cJW�% ~����R��d)�f���|Τ@�z��c_gǤ��u�t��Ҿr���aۏC���.�9�=�P"�p���k�d�mS:��(�C��|���_�m�nӟb�Yh���xm��A��k�7U�j̓r0���M��x~!�0�KK��i�
J	Jk��m �x����m��=�\W̳��?$�̻��1u8�k^�����	k�������"Y�͈Q�v�&�v)�1�ߴ�#o,xK|6V��ܜ�Ƒ���Ix�j�" +H؍nX��[�����hq��$Le���gDs��pj/�J�ZG�܈��;�P�J���
^ir:�Ӿik(��R�J�����oe	Ɠ�A)�s_V��y��	����d��qp�����6�_^���3��4��m&K��p���1]wp�Z~sċ�:OBy�.��� \����n<ݫl��{�5�%q��S�ʹ��3?�ud�4{OT�����>� �\��LXL5E��.hg�!���D7>LP1U+8�)���hx�R��<�ck��Be�f���9 )٫����MOA
��J�I��	-<�MRR��a���A+�0B��8������!y1'$zJ��Dè�ǺD@��D)!l��b�ܨ	U�_��'��?�2��      T   �  x���Mn�0���a
���ڠ�n�:�(����KCNS��|��IY
|Η9�>�t�=�S<�4ϝF�m�r)oq}��4m^��_1w����iK��Y�����6����)�����s\9t��50�a[f�<#�/ķ'X֗����}G�{�lJI��Nipߖ%�ߥf)Ӗq.�::ڡL�M�,�&`�V,k���=I�Ъt׌�i��k*D+��Z�n�?��o[K�V`� �-�h_zJ�;���6�(�R����A�Fr9ݳ�&�DF��B�R�b�>p�1e��~ݦ9a+�3W��	vԶW�`?�x�B�t�����=������CcA��p60EP��Y+brǶ��RX_p��(h2��A�d������)�N���sgݔ��)*�R���^1��DL޾P�e >T8���#;��;Bz����W�U�S"�M5w��MS�f��hS��NĔ�k������eꏟ���3��      U   �  x���o�0ǟ�_ѷ���mS����DswKL�*,H	���+���;�d�ymb����~�/_� c�#p�*��$�`�3�	�Ɲ���z?/��rHw4dqm �)|��X���B�a�"<`���ʇ�6f	O����sgֆ�	�i������r�.�����0���֍�#ъzѵ=u���� ����ٖ^�,�K���'$���	�t���6��>
�D��maqQ~�Y��"ye�p⒔B�I�L��H"fq^7/�w#N�#]�|�7��p4��u)�G|��O���n�e�p����Y�����x�	����+��.���Ҁ���:��%b��ln���8p���٦ıN(}'NL���yѨ���M��0Ju�x���}�7J�����H��
�6Vɦ.���
.<��G]X7,so֨�*���
�J�xOr�E�Q��:o�V�J�Ǔ��PdW�,��c(����0��2��@, v���ծ�J�%n�N�^���/\/�W�X9,F !��O��H��c �M���+:ʁ+� ���ʪ�~E�N/���!�^L���QY),����}�^��%k����?�`�^���H3���
��H�fj"�T��+*zEEv}���V�8�ү�ȮS��#&J�p��"�nͮ�(c�8�#��ȶ��`u
��X0:��p�j�~ v�#      O   �  x�ݛYs�6ǟ�O��<�V� q���>���&);�&� g`��J��� �3�mO�Rm��&H44D���o`�#U^#3�����ѳp����$CDD_�2aI*%!)�w���R�<�M�t�*W���Z��2z9Ԯi��R�}xd�Mӹ�5u����Mk១�l|��ul�-���WqS۸sզ�=ꮁ��fS:�������(�j�4!�9��Dm��R��L+)eh�������PW�߿�� ��|�N��\��oӋ߾Y�~}��/ί�ޜW?�q��OH����
�g/�%�?��z?º�7ݣ��m�4~��'���
�c�o>��M1v�I�e��HUרh�J�F������<'NPB��c�R&�A�%׹�߶���s߃c��6mSخ�{�|��l~趸��P��ߺ�"��Z5���X��X��#Q�N�D�`�LgH�\ #�R8�,��cO1�U�x��W��R���;g��Ȃ��(�m���{�ڦ�m}�\u.z���>��(�(a[���d)����n�q���;�[\�5V����昄�Q���*<>���Q� 6�&����Ie�X�,I"�$[N�X�b6a��P������PŅ-�R;�kl\5e������E��L^�j��P��w���xY���zȡ$�sH=>�+�re�\���oD�L7BLI�'�ȓ���0]@�{��UlQ�TX�RI��Z�+5��&���bv{�e�jwq���S�~��2w���n�^��ҶE�\-w���ϱ��iՖ
]��G=��藱A��@x�HBpF��|2�@���˂s�j�#��U�E��X3]$B-	�S��/�hf��:d�%�#�#�vk��êW.z���msLd�ņ,���NT�����,�)AX�Ʀ�K��L�2*�<�R
;�l"�5q�9Heq���!�M�*�ǵ����3xiw�Q%�H���=��ԪV��ψ}7��,.mC�����6���g�V��a*ax�;tq=��,~7�p�V�$�qظr��K�mn)Q�C���v�TƘ'UD���Q���Ru}�ѓ�=�
����f#\�0��(|�N�ӘM���TB�g���QnSFT�HF�����XZPS�D�VF��ֶ ����V�-K��g�V���C/����V�h�*�� ��K�uL�9;��s�A�D��4h5�ƶ8�y�}��1f�D�T�FR!n�~���kI������}�A>�I��qA�L�l��;��.3��-��7z},0�0�#R�ɢus�Z���q���Ў~�������0�0��O���6�g	�@��r�/�D�����Ri��rlYZY�%9~�ٝ�q�Ä�s�LB����-���F�[`p=��qح�4K	P����ʠ�H3�u�,�3dzF	�8�@����s�����8�c��랊q���xkk�d-(�襭Av��qeC]5	d�qL�a�Ϡ�/N�`��1�8�`��I��DBID�"al)�`6���W� YG�YB���ƁǗ��?_.���L��r��B���
�X]۾�^���ɶtO�no?�"�(=6���n
)U�$����I.%J,� V`�|�S�&��ڪ:�t��[��� [�&!��C��V��U݃�ms��u��:�ؓh���p��4ns�t���oA�,�?AwʶvUlK�
P��m���$���Sw�y�,�s���i��yr���M�~;�A��L���"��`T2���-�
���CZQ� �$$�5h�eI�`6a�e��|[m�����
�;�v�* �{�,��+�'k����AR�i?#�omGvM�6���Nm�����[�Ƴ�����Vڳ���xܴF�}h���`������}��M�dw`J���Jg������oE�����1F$��O)Xfs�O'�O�.�S�)��%���'��s� #3��K-���bvN�>�ƈ�r��/!��|(p��L����⡄`�����3#����9��q0�62�m#�����g�9 ��~��,�λ��t<�q�Y�u*��ѷ��ٶ���W����dF�F�}kp�Sb��5� �c0Ҍ)nU��$��b��!CfI�U�)�N�����8�
^�c�=��^ڵ�@���[����wM�.��(4ٚ�:��)�*�4�_c��lcx�j�J���v6������I$��+w�y���45(����UM�AV
��.�H&{S�H&әɽ��V u��+D�Hy,�L��"�t�X��	ߟw�pL�!�r �j����]ܴ�M)��$L��`�rrW:?Ze�����0����x �{����1�OBsҦ@n�@�[�K��~@G�6. �FbX�M�`)9X���C�gh~P�z�!�c�Q�.��:W��[���)�s��g����� [�iC(� �P��s�db�
L�Y:5?�lB�i8X� �U����e��Cu�] a V-��l(�|����:��q��`S���F��P/
g��g;��By�:�Gb�Q�c�J��ȇ=]�����9��G1��[O2j�^��� ���:��_�j����cI(e���"#�`i$"�HUB"ɠYH�p"�%�O1;���m�����fUt�
�c:���o�1�E����:����W��B�&ۓ}J1	�����L@�!�c� n���$�It�(LX�-Qt��]W,�p1�,u�Xżd��H�p��0��u(�=�N_t���N�|wg���_>��#�f��i �q��(I3��b&��x��3�XJ������	fw�q����f��@!�(�������� }�\G?�Z��~�XH�b����}B-e"�*$E4�$��n�Hpw�@8��O����s^���{
h��!Q:�45ҍwQ�flFO�f��H��1�DBvdv?�K*H��D��eX#��ȱ�q�V&���+N1�m�,�ym��l�i���n���&4�'�1�)�3%�1�tfro�;ύ_���R�"e�F)��&)gY�x2}�پ�i���*�ռ���N.�����ʹ�3n��a,7|���r}<]�`6���~m������
b��Sx:쿥I�'4�A�lZd/U��4���5 ����7�ĉd3���W,Ҳ4�A�)J!�KA`�k�l��47\b�;O��ݽ:���cΞu�9� ~?���� ���      W      x������ � �      V   �  x�ՙMS�H�ϣ_�{T[��=G���2�����"�b\1�������%����T�3��ےZ� 1ɗ�]>+6b�?�B���*Wϛ��?I��"�ߤ�������Sv�%1�^�_���b�����z4���OŢ\�����|q?�<o�ţ�ʟ�e�j�f_'��'͗n��v�.(��ڷ�N|����gY�����,���:_�㯻b��D\�l�Zϗ��՟g餜�����n'i���|4�9IOV��������r�jg�t��o����b�̷������+����������2��vS ��Ǐ]?델-��6�2�/�M@��@��٢�݋�oYF�vh`�mPK��C�^���-����ă=n�� S��(��t|~z�~*�٢�����Al�X��+�.�_���O�W�2{��&J	�^��m��2(�������7�rxl7A��[t9����R�vn��X+��4�ָ�wi`m0�n��V x�ڡ���u��u��]�F�5�p��R�0��B]�a�L!�E�+�q·�xt�WPT������W��T��B��m5�mkDh�m-�M�֡8�����i���v�r�i;�.�$�s�����8�z��3(69�a}�A:��*��	�}!� � q?���UP ��s("��7^
|@l�����W��>�i����������5�+�#����dp}郀�Գ_�H���!IR� ���J�E�uS�N����`��,T��<�����G�q�ԣ����G���GE6C=j28��13FKv�zt��=�8F���t[�s)���s	�p�Ab�:fD���&y����9��u�����=Ӷ�umD�,�H��+��CsfDH�{K��`;^T
��,����� e�� M8�P�$z����w	 Rd=��3n{��s��"��6),^ǜʐ@_Y��W��#}�)�>��θ�~$�}�(�a�k,Y��Z�@_k��׆�#}m)������מ|�~ ���%��W�F�@� Ƀ�E[����Y}c�[�K>G�8rX��՜�P���L$���c%-�I�-�B�J����&���!yPXK[�������:�.��|q$�����^����"��i�iZ�Os���=D���h!��Q���{�s��_X.���K��9z�u���+:����u-�!���-9{="�.�'��c �'8FZ����{8��h��Ǡ�y���I���+��      X   V   x�3��I�K/MLO-�2�tq��2�OM�2��J,K�2��tq�2	)���s�s:�f�(W���rYp:�䗦p��qqq t�     