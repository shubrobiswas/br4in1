function varargout = type1b(varargin)
% TYPE1B MATLAB code for type1b.fig
%      TYPE1B, by itself, creates a new TYPE1B or raises the existing
%      singleton*.
%
%      H = TYPE1B returns the handle to a new TYPE1B or the handle to
%      the existing singleton*.
%
%      TYPE1B('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TYPE1B.M with the given input arguments.
%
%      TYPE1B('Property','Value',...) creates a new TYPE1B or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before type1b_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to type1b_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help type1b

% Last Modified by GUIDE v2.5 30-Dec-2014 03:27:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @type1b_OpeningFcn, ...
                   'gui_OutputFcn',  @type1b_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before type1b is made visible.
function type1b_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to type1b (see VARARGIN)

% Choose default command line output for type1b
handles.output = hObject;
initial_l=getappdata(0,'AxesTableData');
set(handles.pretransform,'Data',initial_l);
set(handles.posttransform,'Data',initial_l);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes type1b wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = type1b_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function axis_Callback(hObject, eventdata, handles)
% hObject    handle to axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of axis as text
%        str2double(get(hObject,'String')) returns contents of axis as a double


% --- Executes during object creation, after setting all properties.
function axis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function linkno_Callback(hObject, eventdata, handles)
% hObject    handle to linkno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of linkno as text
%        str2double(get(hObject,'String')) returns contents of linkno as a double


% --- Executes during object creation, after setting all properties.
function linkno_CreateFcn(hObject, eventdata, handles)
% hObject    handle to linkno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in transformbutton.
function transformbutton_Callback(hObject, eventdata, handles)
% hObject    handle to transformbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
type=get(handles.typebox,'Value');
if type==1
linkno=str2double(get(handles.linkno,'String'));
k=sym(sprintf('theta%d',linkno));
syms phi si;
AxesTable=get(handles.pretransform,'Data');
Si=AxesTable(linkno,:);
U=[0,Si];
axis1=(get(handles.axis,'Data'));
screw1=[cos(phi/2),sin(phi/2)*axis1];
axis2=(get(handles.axis2,'Data'));
msg=('Axis of transformation cannot equal to Si');
if axis1==Si
    errordlg(msg);
    error(msg);
elseif axis2==Si
    errordlg(msg);
    error(msg);
end
screw2=[cos(si/2),sin(si/2)*axis2];
angle=(str2double(get(handles.angle,'String'))/360)*2*pi;
angle2=(str2double(get(handles.angle2,'String'))/360)*2*pi;
screw=qmult(screw1,screw2);
screwt=qmult(screw,U);
output=subs(screwt,phi,angle);
output=subs(output,si,angle2);
output=eval(output);
final=output(2:4);
AxesTable(linkno,:)=final;
set(handles.posttransform,'Data',AxesTable);
else 
    errordlg('Type 1B2 not yet implemented');
end




function angle_Callback(hObject, eventdata, handles)
% hObject    handle to angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of angle as text
%        str2double(get(hObject,'String')) returns contents of angle as a double


% --- Executes during object creation, after setting all properties.
function angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function angle2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in typebox.
function typebox_Callback(hObject, eventdata, handles)
% hObject    handle to typebox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of typebox
