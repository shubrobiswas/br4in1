function varargout = type2B(varargin)
% type2B MATLAB code for type2B.fig
%      type2B, by itself, creates a new type2B or raises the existing
%      singleton*.
%
%      H = type2B returns the handle to a new type2B or the handle to
%      the existing singleton*.
%
%      type2B('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in type2B.M with the given input arguments.
%
%      type2B('Property','Value',...) creates a new type2B or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before type2a_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to type2a_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help type2B

% Last Modified by GUIDE v2.5 29-Dec-2014 18:59:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @type2a_OpeningFcn, ...
                   'gui_OutputFcn',  @type2a_OutputFcn, ...
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


% --- Executes just before type2B is made visible.
function type2a_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to type2B (see VARARGIN)

initial_l=getappdata(0,'LinkTableData');
set(handles.pretransformtable,'Data',initial_l);
set(handles.posttransformtable,'Data',initial_l);
% Choose default command line output for type2B
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes type2B wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = type2a_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function link2_Callback(hObject, eventdata, handles)
% hObject    handle to link2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of link2 as text
%        str2double(get(hObject,'String')) returns contents of link2 as a double


% --- Executes during object creation, after setting all properties.
function link2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function link1_Callback(hObject, eventdata, handles)
% hObject    handle to link1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of link1 as text
%        str2double(get(hObject,'String')) returns contents of link1 as a double


% --- Executes during object creation, after setting all properties.
function link1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link1 (see GCBO)
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
A=getappdata(0,'LinkTableData');
link1=str2double(get(handles.link1,'String'));
link2=str2double(get(handles.link2,'String'));
A([link1 link2],:) = A([link2 link1],:);
set(handles.posttransformtable,'Data',A);
setappdata(0,'LinkTableData',A);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pretransformtable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pretransformtable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
