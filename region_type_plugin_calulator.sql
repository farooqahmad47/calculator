prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_210200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.0'
,p_default_workspace_id=>1473666803761018
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'GLOBALDB'
);
end;
/
 
prompt APPLICATION 100 - cPanel
--
-- Application Export:
--   Application:     100
--   Name:            cPanel
--   Date and Time:   03:57 Wednesday January 3, 2024
--   Exported By:     FAWAD
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 69563696168565234
--   Manifest End
--   Version:         21.2.0
--   Instance ID:     697830337159228
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/calulator
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(69563696168565234)
,p_plugin_type=>'REGION TYPE'
,p_name=>'CALULATOR'
,p_display_name=>'CALULATOR'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function CALULATOR',
'  ( p_region              in apex_plugin.t_region',
'  , p_plugin              in apex_plugin.t_plugin',
'  , p_is_printer_friendly in boolean',
'  )',
'return apex_plugin.t_region_render_result',
'as',
'l_result                  apex_plugin.t_region_render_result;',
'l_item_name             p_region.attribute_01%type := p_region.attribute_01;',
'begin',
'htp.p(''<!DOCTYPE html>',
'<html lang="en">',
'<head>',
'    <meta charset="UTF-8">',
'    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
'    <style>',
'        .calculator-container {',
'            background-color: #fff;',
'            border-radius: 8px;',
'            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);',
'            padding: 20px;',
'            text-align: center;',
'            width: 300px;',
'        }',
'',
'        .calculator-container button {',
'            width: 48px;',
'            height: 48px;',
'            font-size: 18px;',
'            margin: 5px;',
'            cursor: pointer;',
'            border: none;',
'            background-color: #e0e0e0;',
'            color: #333;',
'            border-radius: 5px;',
'            transition: background-color 0.3s;',
'        }',
'',
'        .calculator-container button:hover {',
'            background-color: #d4d4d4;',
'        }',
'',
'        .calculator-container #clear {',
'            background-color: #ff6666;',
'            color: #fff;',
'        }',
'',
'        .calculator-container #equals {',
'            background-color: #4caf50;',
'            color: #fff;',
'        }',
'    </style>',
'</head>',
'<body>',
'    <div class="calculator-container">',
'        <button onclick="appendToDisplay(''''7''''); return false;">7</button>',
'        <button onclick="appendToDisplay(''''8''''); return false;">8</button>',
'        <button onclick="appendToDisplay(''''9''''); return false;">9</button>',
'        <button onclick="appendToDisplay(''''/''''); return false;">/</button>',
'        <br>',
'        <button onclick="appendToDisplay(''''4''''); return false;">4</button>',
'        <button onclick="appendToDisplay(''''5''''); return false;">5</button>',
'        <button onclick="appendToDisplay(''''6''''); return false;">6</button>',
'        <button onclick="appendToDisplay(''''*''''); return false;">*</button>',
'        <br>',
'        <button onclick="appendToDisplay(''''1''''); return false;">1</button>',
'        <button onclick="appendToDisplay(''''2''''); return false;">2</button>',
'        <button onclick="appendToDisplay(''''3''''); return false;">3</button>',
'        <button onclick="appendToDisplay(''''-''''); return false;">-</button>',
'        <br>',
'        <button onclick="appendToDisplay(''''0''''); return false;">0</button>',
'        <button onclick="appendToDisplay(''''.''''); return false;">.</button>',
'        <button id="clear" onclick="clearDisplay(); return false;">C</button>',
'        <button onclick="appendToDisplay(''''+''''); return false;">+</button>',
'        <button id="calculateButton" onclick="calculate(); return false;">=</button>',
'    </div>',
'    <script>',
'        function calculate() {',
'            try {',
'                var result = eval(document.getElementById("''||l_item_name||''").value);',
'',
'                // Set the calculated result to the APEX item',
'                apex.item("''||l_item_name||''").setValue(result);',
'',
'                // Optionally, update the display with the result',
'                document.getElementById("''||l_item_name||''").value = result;',
'            } catch (error) {',
'                document.getElementById("''||l_item_name||''").value = "Error";',
'            }',
'        }',
'',
'        function appendToDisplay(value) {',
'            document.getElementById("''||l_item_name||''").value += value;',
'        }',
'',
'        function clearDisplay() {',
'            document.getElementById("''||l_item_name||''").value = "";',
'        }',
'    </script>',
'</body>',
'</html>',
''');',
'return l_result;',
'end;'))
,p_api_version=>2
,p_render_function=>'CALULATOR'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(69564132028567581)
,p_plugin_id=>wwv_flow_api.id(69563696168565234)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Result'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
